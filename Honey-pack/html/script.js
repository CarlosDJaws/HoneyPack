$(function () {
    let audioPlayer = null;

    window.addEventListener('message', function (event) {
        const item = event.data;

        if (item.type === "show") {
            $('#effect-image').attr('src', item.image);
            $('#container').fadeIn(200);

            // Play sound
            if (audioPlayer !== null) {
                audioPlayer.pause();
            }
            audioPlayer = new Audio(item.sound, 1.0);
            audioPlayer.volume = item.volume;
            audioPlayer.play();
            
            // Hide the image after a short delay
            setTimeout(function() {
                $('#container').fadeOut(500);
            }, 1500); // The image will be visible for 1.5 seconds
        }

        if (item.type === "stopSound") {
            if (audioPlayer !== null) {
                audioPlayer.pause();
                audioPlayer = null;
            }
        }
    });
});
