import Typed from 'typed.js';


const loadDynamicBannerText = () => {
  const banner = document.getElementById("banner-typed-text");
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Amusez-vous !","Partagez une expérience rebondissante"],
      typeSpeed: 60,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
