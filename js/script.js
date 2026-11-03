

document.querySelectorAll('.faq-question').forEach(button => {
    button.addEventListener('click', () => {
        const answer = button.nextElementSibling;
        const icon = button.querySelector('.faq-icon');

        // Toggle display of the answer
        answer.style.display = answer.style.display === 'block' ? 'none' : 'block';

        // Toggle the arrow icon direction
        if (answer.style.display === 'block') {
            icon.textContent = '▲'; // Arrow up
        } else {
            icon.textContent = '▼'; // Arrow down
        }

        // Optionally, close other open answers
        document.querySelectorAll('.faq-answer').forEach(otherAnswer => {
            if (otherAnswer !== answer) {
                otherAnswer.style.display = 'none';
                const otherIcon = otherAnswer.previousElementSibling.querySelector('.faq-icon');
                otherIcon.textContent = '▼';
            }
        });
    });
});

// Example: Load more cards dynamically
const grid = document.querySelector('.experience-grid');

function addCard(title, description, image) {
    const card = document.createElement('div');
    card.className = 'experience-card';
    card.style.backgroundImage = `url(${image})`;

    const overlay = document.createElement('div');
    overlay.className = 'overlay';

    const heading = document.createElement('h3');
    heading.textContent = title;

    const desc = document.createElement('p');
    desc.textContent = description;

    overlay.appendChild(heading);
    overlay.appendChild(desc);
    card.appendChild(overlay);

    grid.appendChild(card);
}

// Example usage
addCard('New Experience', 'An exciting addition to our offerings!', 'images/new-experience.jpg');