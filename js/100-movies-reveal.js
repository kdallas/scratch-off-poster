let sfxMuted = false;

const panelSmarts = function(panel, listID) {
    const imgPanel = panel.parentElement;
    let img = new Image();
    img.addEventListener('load', imgOnLoad);
    img.crossOrigin = "Anonymous";
    img.src = imgPanel.querySelector('img').src;

    function imgOnLoad() {
        panel.width = img.width;
        panel.height = img.height;
        const pixels = panel.width * panel.height;

        let downTimer = 0;
        const panelCtx = panel.getContext('2d');

        panelCtx.drawImage(img, 0, 0, panel.width, panel.height);
        panelCtx.save();

        const defaultStatusMsg = "Waiting for something amazing to happen...";
        const scratchedStatusMsg = "Well done, you claim to have watched 100% of the entirety of this movie!";
        const scratchingStatusMsg = "What do you think you're doing?!";

        const controlsArea = imgPanel.parentElement.querySelector('.controls');
        const resetIcon = controlsArea.querySelector('.icon-cancel-circle');
        resetIcon.setAttribute('title', "Restore the scratchable layer!");
        const fastForwardIcon = controlsArea.querySelector('.icon-forward2');
        fastForwardIcon.setAttribute('title', "Scratch this movie off the lazy way!");

        const movieNo = imgPanel.getAttribute('data-no');
        let movieWatched = parseInt(imgPanel.getAttribute('data-watched'));

        let statusIcon = null;
        if (movieWatched) {
            statusIcon = controlsArea.querySelector('.icon-checkmark2');
            statusIcon.setAttribute('title', scratchedStatusMsg);
        } else {
            statusIcon = controlsArea.querySelector('.icon-neutral');
            statusIcon.setAttribute('title', defaultStatusMsg);
        }


        resetIcon.addEventListener("click", function() {
            resetPanel();
        });

        fastForwardIcon.addEventListener("click", function() {
            afterScratched();
            fastForwardIcon.classList.add('hide');
        });

        panel.addEventListener("mousedown", scratchingStarted);
        panel.addEventListener("mouseup", scratchingEnded);

        panel.addEventListener("mousemove", function(e) {
            const brushPos = getBrushPos(e.clientX, e.clientY);
            if (detectLeftButton(e)) {
                drawDot(brushPos.x, brushPos.y);
            }
        }, false);

        panel.addEventListener("touchstart", scratchingStarted);
        panel.addEventListener("touchend", scratchingEnded);

        panel.addEventListener("touchmove", function(e) {
            e.preventDefault();
            const touch = e.targetTouches[0];
            if (touch) {
                const brushPos = getBrushPos(touch.clientX, touch.clientY);
                drawDot(brushPos.x, brushPos.y);
            }
        }, false);


        function scratchingStarted()
        {
            if (!sfxMuted) {
                soundbox.play("scratching", null, null, true);
            }
            statusIcon.classList.remove('icon-neutral');
            statusIcon.classList.add('icon-baffled');
            statusIcon.setAttribute('title', scratchingStatusMsg);
            resetIcon.classList.remove('hide');
            scratchTimer();
        }

        function scratchingEnded()
        {
            clearTimeout(downTimer);
            panelCtx.closePath();
            if (isScratched()) {
                afterScratched();
            } else {
                window.soundbox.stop_all();
            }
        }

        function detectLeftButton(event)
        {
            if ('buttons' in event) {
                return event.buttons === 1;
            } else if ('which' in event) {
                return event.which === 1;
            } else {
                return event.button === 1;
            }
        }

        function getBrushPos(xRef, yRef)
        {
            const panelRect = panel.getBoundingClientRect();
            return {
                x: Math.floor((xRef-panelRect.left)/(panelRect.right-panelRect.left)*panel.width),
                y: Math.floor((yRef-panelRect.top)/(panelRect.bottom-panelRect.top)*panel.height)
            };
        }

        function drawDot(mouseX,mouseY)
        {
            panelCtx.globalCompositeOperation = 'destination-out';
            panelCtx.lineJoin = 'round';
            panelCtx.lineCap = 'round';
            panelCtx.fillStyle = '#000';

            const clientWidth = panelCtx.canvas.clientWidth;
            const clientHeight = panelCtx.canvas.clientHeight;
            const brushX = panel.width / clientWidth * 4;
            const brushY = panel.height / clientHeight * 8;

            panelCtx.beginPath();
            panelCtx.arc(mouseX, mouseY, (brushX + brushY), 0, 2 * Math.PI);
            panelCtx.closePath();
            panelCtx.fill();

            panelCtx.beginPath();
            panelCtx.moveTo(mouseX, mouseY);
        }

        function updateUser(action)
        {
            ajaxPost(encodeURI('action=' + action + '&listID=' + listID + '&movieNo=' + movieNo), function(response) {
                if (response === 'added') {
                    imgPanel.setAttribute('data-watched', '1');
                    movieWatched = 1;
                }
                else if (response === 'removed') {
                    imgPanel.setAttribute('data-watched', '0');
                    movieWatched = 0;
                }

                const watchCount = panel.closest('.grid-container.full').querySelector('.watched');
                let no = parseInt(watchCount.textContent);
                watchCount.textContent = String(movieWatched ? (no+1) : (no-1));
            });
        }

        function scratchPercent()
        {
            const imageData = panelCtx.getImageData(0, 0, panel.width, panel.height);
            let hits = 0;

            for (let i=0, ii=imageData.data.length; i<ii; i=i+4) {
                if (imageData.data[i] === 0 && imageData.data[i+1] === 0 && imageData.data[i+2] === 0 && imageData.data[i+3] === 0) {
                hits++;
                }
            }

            return (hits / pixels) * 100;
        }

        function isScratched()
        {
            if (scratchPercent() > 90) {
                return true;
            }

            if (scratchPercent() > 35 || imgPanel.classList.contains('multi-img')) {
                fastForwardIcon.classList.remove('hide');
            }

            return false;
        }

        function afterScratched()
        {
            window.soundbox.stop_all();
            panelCtx.clearRect(0, 0, panel.width, panel.height); // better than display:none, as we can re-use it
            panel.classList.add('hide'); // still need to hide the canvas to prevent the continued mousedown (scratching sound) and cursor
            if (!sfxMuted) {
                soundbox.play("pickup7a");
            }
    
            fastForwardIcon.classList.add('hide');
            statusIcon.classList.remove('icon-baffled');
            statusIcon.classList.add('icon-checkmark2');
            statusIcon.setAttribute('title', scratchedStatusMsg);
    
            if (!movieWatched) {
                updateUser('add');
            }
        }

        function resetPanel()
        {
            panelCtx.restore();
            panelCtx.drawImage(img, 0, 0, panel.width, panel.height);
            panelCtx.save();
            if (!sfxMuted) {
                soundbox.play("pickup7b");
            }

            resetIcon.classList.add('hide');
            fastForwardIcon.classList.add('hide');
            statusIcon.classList.remove('icon-checkmark2','icon-baffled');
            statusIcon.classList.add('icon-neutral');
            statusIcon.setAttribute('title', defaultStatusMsg);
            panel.classList.remove('hide');
    
            // if movie was already marked as "watched", then we need to update the database
            if (movieWatched) {
                updateUser('remove');
            }
        }

        function scratchTimer()
        {
            downTimer = setTimeout(function () {
                if (isScratched()) {
                    clearTimeout(downTimer);
                    afterScratched();
                } else {
                    scratchTimer();
                }
            }, 1500);
        }
    }
};

const ajaxPost = function(request, cb) {
    const xhr = new XMLHttpRequest();

    xhr.open('POST', './');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onload = function() {
        if (xhr.status === 200 && xhr.responseText === 'failed') {
            alert('Something went wrong.  Response was: ' + xhr.responseText);
        }
        else if (xhr.status !== 200) {
            alert('Request failed.  Returned status of: ' + xhr.status);
        }
        else {
            if (typeof cb !== 'undefined') {
                cb(xhr.responseText);
            }
        }
    };

    xhr.send(request);
};

const playBtnSfx = function() {
    if (!sfxMuted) {
        const sounds = [
            'comp11',
            'comp12'
        ];
        const soundNo = Math.floor(Math.random()*sounds.length);
        soundbox.play(sounds[soundNo]);
    }
};

const switchTab = function(list_id) {
    const elems = document.getElementsByClassName("tabmenu");
    for (let i = 0; i < elems.length; i++) {
        elems[i].removeAttribute('aria-selected');
        if (elems[i].getAttribute('data-list_id') === list_id) {
            elems[i].setAttribute('aria-selected', 'true');
        }
    }
};

const loadRouting = function(url, callback) {
    const script = document.createElement("script");
    script.src = url;
    document.body.appendChild(script);
    script.onreadystatechange = callback;
    script.onload = callback;
};

const initRouting = function() {
    const tabLinks = document.querySelectorAll('.tabmenu');
    const qs = '?lid=';
    let routes = [];
    for (let i = 1; i < (tabLinks.length+1); i++) {
        routes.push(new Route( String(i), qs+String(i), (i===1) ));
    }
    new Router(routes);
};

const addGridEvents = function() {
    const gridTops = document.querySelectorAll('.cards-100-top');

    gridTops.forEach(function(gridTop){
        const gridBody = gridTop.nextElementSibling; // .cards-100-gallery

        const waitAnim = gridTop.querySelector('.waiting');
        const codeInput = gridTop.querySelector('.userCode > input');
        const codeButton = gridTop.querySelector('.button');

        codeInput.addEventListener("keyup", function(e) {
            if (e.key === "Enter") {
                waitAnim.classList.remove('hide');
                codeButton.classList.add('hide');

                const oldCode = codeInput.getAttribute('data-code');
                ajaxPost(encodeURI('codeInput=' + codeInput.value + '&listID=' + gridBody.dataset.id), function(response) {
                    if (response !== oldCode.toUpperCase()) {
                        document.location.reload(true);
                    } else {
                        codeButton.classList.remove('hide');
                        waitAnim.classList.add('hide');
                        codeInput.value = oldCode;
                    }
                });
            }
        });

        codeButton.addEventListener("click", function() {
            playBtnSfx();
            waitAnim.classList.remove('hide');
            codeButton.classList.add('hide');
            ajaxPost(encodeURI('codeRequest=1&listID=' + gridBody.dataset.id), function() {
                document.location.reload(true);
            });
        });

        const panels = gridBody.querySelectorAll('canvas');
        panels.forEach(function(panel){
            panelSmarts(panel, gridBody.dataset.id);
        });

        // ensure selected tab is the same as the currently loaded list
        switchTab(gridBody.dataset.id);

        setTimeout(function() {
            gridBody.classList.remove('hide');
            waitAnim.classList.add('hide');
        }, 500);
    });
};

const isOverflown = function(element) {
    return element.scrollHeight > element.clientHeight || element.scrollWidth > element.clientWidth;
};

(function() {
    const tabLinks = document.querySelectorAll('.tabmenu');
    tabLinks.forEach(function(tab){
        tab.addEventListener("click", function() {
            playBtnSfx();
            switchTab(this.getAttribute('data-list_id'));
            document.getElementById('foot-criteria').textContent = this.getAttribute('data-foot_criteria');
            const footLogoClass = this.getAttribute('data-list_type') === 'books' ? 'google-books' : 'themoviedb';
            document.getElementById('foot-logo').setAttribute('class',footLogoClass+'-logo');
        });
    });

    const muteButton = document.getElementById('mute-btn');
    if (muteButton.classList.contains('icon-volume-mute2')) {
        sfxMuted = true;
    }

    muteButton.addEventListener("click", function() {
        if (muteButton.classList.contains('icon-volume-high')) {
            window.soundbox.stop_all();
            sfxMuted = 1;
            muteButton.classList.remove('icon-volume-high');
            muteButton.classList.add('icon-volume-mute2');
            muteButton.title = 'Unmute';
        } else {
            sfxMuted = 0;
            playBtnSfx();
            muteButton.classList.remove('icon-volume-mute2');
            muteButton.classList.add('icon-volume-high');
            muteButton.title = 'Mute';
        }
        ajaxPost(encodeURI('muteSfx=' + sfxMuted));
    });

    window.addEventListener("load", function() {
        const path = '/100-movies/assets/sound/';
        window.soundbox = new SoundBox();
        soundbox.load('scratching', path+'Scratching-Paper.mp3').then(function(evt){ });
        soundbox.load('pickup7a',   path+'Pickup_Coin7a.mp3').then(function(evt){ });
        soundbox.load('pickup7b',   path+'Pickup_Coin7b.mp3').then(function(evt){ });
        soundbox.load('comp11',     path+'STcomp011.wav').then(function(evt){ });
        soundbox.load('comp12',     path+'STcomp012.wav').then(function(evt){ });
    });

    const tabs = document.querySelector('.tabs');
    if (isOverflown(tabs)) {
        tabs.classList.add('show-menu-btn');
    }

    window.addEventListener("resize", function() {
        if (isOverflown(tabs)) {
            tabs.classList.add('show-menu-btn');
        } else {
            tabs.classList.remove('show-menu-btn');
            tabs.classList.remove('show-menu-items');
        }
    });

    const menuBtn = document.querySelector('.icon-menu');
    menuBtn.addEventListener("click", function() {
        if (tabs.classList.contains('show-menu-items')) {
            tabs.classList.remove('show-menu-items');
        } else {
            tabs.classList.add('show-menu-items');
        }
    });

    loadRouting('./js/routing.min.js', initRouting);
})();
