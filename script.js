const sakuraContainer = document.getElementById("sakura-container");

/* Sakura petals */
function createPetal() {
    const petal = document.createElement("div");
    petal.classList.add("petal");

    petal.style.left = Math.random() * window.innerWidth + "px";

    const duration = Math.random() * 5 + 5;
    petal.style.animationDuration = duration + "s";

    const size = Math.random() * 12 + 8;
    petal.style.width = size + "px";
    petal.style.height = size + "px";

    sakuraContainer.appendChild(petal);

    setTimeout(() => {
        petal.remove();
    }, duration * 1000);
}

setInterval(createPetal, 300);

/* Navbar glow on scroll */
window.addEventListener("scroll", function () {
    const nav = document.querySelector("nav");

    if (window.scrollY > 50) {
        nav.style.boxShadow = "0 5px 25px rgba(188,0,45,0.35)";
    } else {
        nav.style.boxShadow = "none";
    }
});

/* Intro animation */
const enterBtn = document.getElementById("enter-btn");
const intro = document.getElementById("intro-screen");
const leftDoor = document.querySelector(".left-door");
const rightDoor = document.querySelector(".right-door");

const doorSound = document.getElementById("doorSound");
const welcomeSound = document.getElementById("welcomeSound");
const bgMusic = document.getElementById("bgMusic");

enterBtn.addEventListener("click", async () => {
    try {
        doorSound.volume = 1;
        welcomeSound.volume = 0.8;
        bgMusic.volume = 0.18;

        doorSound.play();
        welcomeSound.play();

        setTimeout(() => {
            bgMusic.play();
        }, 1200);

        leftDoor.classList.add("open-left");
        rightDoor.classList.add("open-right");

        setTimeout(() => {
            intro.style.display = "none";
        }, 2200);

    } catch (error) {
        console.log("Audio blocked by browser:", error);
    }
});

/* Katana click sound for links/buttons */
const clickSound = new Audio("assets/click.mp3");
clickSound.volume = 0.6;

document.querySelectorAll("a, button").forEach(item => {
    item.addEventListener("click", () => {
        if (item.id !== "enter-btn") {
            clickSound.currentTime = 0;
            clickSound.play().catch(() => {});
        }
    });
});

/* Smooth reveal animation on scroll */
const cards = document.querySelectorAll(".card, .step, .dashboard-grid img, .about-box");

const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = "1";
            entry.target.style.transform = "translateY(0)";
        }
    });
}, { threshold: 0.2 });

cards.forEach(card => {
    card.style.opacity = "0";
    card.style.transform = "translateY(60px)";
    card.style.transition = "all 0.8s ease";
    observer.observe(card);
});

/* Samurai vibe console easter egg */
console.log(`
⚔️ ============================== ⚔️
  Welcome to Japanese Hiring Intelligence
  Honor Through Data. Precision Through Analytics.
⚔️ ============================== ⚔️
`);
const musicBtn = document.getElementById("music-toggle");

musicBtn.addEventListener("click", () => {
    if (bgMusic.paused) {
        bgMusic.play();
        musicBtn.innerText = "🔊";
    } else {
        bgMusic.pause();
        musicBtn.innerText = "🔇";
    }
});