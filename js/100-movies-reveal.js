var sfxMuted = false;

function panelSmarts(panel, listID)
{
    var imgPanel = panel.parentElement;
    var img = new Image();
    img.addEventListener('load', imgOnLoad);
    img.crossOrigin = "Anonymous";
    img.src = imgPanel.querySelector('img').src;

    function imgOnLoad() {
        panel.width = img.width;
        panel.height = img.height;
        var pixels = panel.width * panel.height;

        var brushRadius = 15;
        var downTimer = 0;
        var panelCtx = panel.getContext('2d');

        panelCtx.drawImage(img, 0, 0, panel.width, panel.height);
        panelCtx.save();

        var defaultStatusMsg = "Waiting for something amazing to happen...";
        var scratchedStatusMsg = "Well done, you claim to have watched 100% of the entirety of this movie!";
        var scratchingStatusMsg = "What do you think you're doing?!";

        var controlsArea = imgPanel.parentElement.querySelector('.controls');
        var resetIcon = controlsArea.querySelector('.icon-cancel-circle');
        resetIcon.setAttribute('title', "Restore the scratchable layer!");
        var fastForwardIcon = controlsArea.querySelector('.icon-forward2');
        fastForwardIcon.setAttribute('title', "Scratch this movie off the lazy way!");

        var movieNo = imgPanel.getAttribute('data-no');
        var movieWatched = parseInt(imgPanel.getAttribute('data-watched'));

        var statusIcon = null;
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
            var brushPos = getBrushPos(e.clientX, e.clientY);
            if (detectLeftButton(e)) {
                drawDot(brushPos.x, brushPos.y);
            }
        }, false);

        panel.addEventListener("touchstart", scratchingStarted);
        panel.addEventListener("touchend", scratchingEnded);

        panel.addEventListener("touchmove", function(e) {
            e.preventDefault();
            var touch = e.targetTouches[0];
            if (touch) {
                var brushPos = getBrushPos(touch.pageX, touch.pageY);
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
            var panelRect = panel.getBoundingClientRect();
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
    
            panelCtx.beginPath();
            panelCtx.arc((mouseX-5), (mouseY+10), brushRadius, 0, 2 * Math.PI);
            panelCtx.closePath();
            panelCtx.fill();
    
            panelCtx.beginPath();
            panelCtx.moveTo((mouseX-5), (mouseY+10));
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

                var watchCount = panel.closest('.grid-container.full').querySelector('.watched');
                var no = parseInt(watchCount.textContent);
                watchCount.textContent = movieWatched ? (no+1) : (no-1);
            });
        }

        function scratchPercent()
        {
            var hits = 0,
                imageData = panelCtx.getImageData(0, 0, panel.width, panel.height);
    
            for (var i=0, ii=imageData.data.length; i<ii; i=i+4) {
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
}

//function ajaxPost(request, cb)
var ajaxPost = function(request, cb)
{
    var xhr = new XMLHttpRequest();

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

var playBtnSfx = function()
{
    if (!sfxMuted) {
        var sounds = [
            'comp11',
            'comp12'
        ];
        var soundNo = Math.floor(Math.random()*sounds.length);
        soundbox.play(sounds[soundNo]);
    }
};

function switchTab(tab_id, tab_content)
{
    playBtnSfx();

    var elems = document.getElementsByClassName("tabcontent");
    var i;
    for (i = 0; i < elems.length; i++) {
        elems[i].style.display = 'none';
    }
    document.getElementById(tab_content).style.display = 'block';

    elems = document.getElementsByClassName("tabmenu");
    for (i = 0; i < elems.length; i++) {
        elems[i].removeAttribute('aria-selected');
    }

    var activeTab = document.getElementById(tab_id);
    activeTab.setAttribute('aria-selected', true);
    ajaxPost(encodeURI('activeListID=' + activeTab.dataset.list_id));
}


(function() {
    var gridTops = document.querySelectorAll('.cards-100-top');

    gridTops.forEach(function(gridTop){
        var gridBody = gridTop.nextElementSibling; // .cards-100-gallery

        var waitAnim = gridTop.querySelector('.waiting');
        var codeInput = gridTop.querySelector('.userCode > input');
        var codeButton = gridTop.querySelector('.button');

        codeInput.addEventListener("keyup", function(e) {
            if (e.key === "Enter") {
                waitAnim.classList.remove('hide');
                codeButton.classList.add('hide');

                var oldCode = codeInput.getAttribute('data-code');
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

        var panels = gridBody.querySelectorAll('canvas');
        panels.forEach(function(panel){
            panelSmarts(panel, gridBody.dataset.id);
        });
    });

    var tabLinks = document.querySelectorAll('.tabmenu');
    tabLinks.forEach(function(tab){
        tab.addEventListener("click", function() {
            switchTab(this.getAttribute('id'), this.getAttribute('data-id'));
        });
    });

    var muteButton = document.getElementById('mute-btn');
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
        window.soundbox = new SoundBox();
        soundbox.load('scratching', '/100-movies/assets/sound/Scratching-Paper.mp3');
        soundbox.load('pickup7a',   '/100-movies/assets/sound/Pickup_Coin7a.mp3');
        soundbox.load('pickup7b',   '/100-movies/assets/sound/Pickup_Coin7b.mp3');
        soundbox.load('comp11',     '/100-movies/assets/sound/STcomp011.wav');
        soundbox.load('comp12',     '/100-movies/assets/sound/STcomp012.wav');

        gridTops.forEach(function(gridTop){
            var gridBody = gridTop.nextElementSibling; // .cards-100-gallery
            gridBody.classList.remove('hide');

            var waitAnim = gridTop.querySelector('.waiting');
            waitAnim.classList.add('hide');
        });
    });
})();
