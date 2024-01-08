document.addEventListener('DOMContentLoaded', () => {
    // Function to toggle the flap of a card
    function toggleCardFlap(card) {
        const cardFlap = card.querySelector('.card-flap');
        // Check if the flap is already shown
        if (cardFlap.classList.contains('flap-visible')) {
            cardFlap.classList.remove('flap-visible');
            cardFlap.style.transform = 'rotateX(-90deg)'; // Hide the flap
        } else {
            // Hide any previously shown flaps
            document.querySelectorAll('.card-flap.flap-visible').forEach(fl => {
                fl.classList.remove('flap-visible');
                fl.style.transform = 'rotateX(-90deg)';
            });
            cardFlap.classList.add('flap-visible');
            cardFlap.style.transform = 'rotateX(0deg)'; // Show the flap
        }
    }

    // Add click event listener to each toggle-info button
    document.querySelectorAll('.toggle-info').forEach(button => { // Fixed the class selector here
        button.addEventListener('click', (e) => {
            e.preventDefault();
            const card = button.closest('.card');
            toggleCardFlap(card);
        });
    });
});
