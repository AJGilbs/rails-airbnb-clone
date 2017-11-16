import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Make pizza in Florence", "Discover dim sum in Taiwan", "Brew Beer in Belgium"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

