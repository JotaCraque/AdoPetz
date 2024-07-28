const btnMobile = document.getElementById('btn-mobile'); /* Seleciona o botão de menu */

function toggleMenu(event) { /* Define a função para abrir/fechar o menu */
  if (event.type === 'touchstart') event.preventDefault(); /* Previne o comportamento padrão em dispositivos móveis */
  const nav = document.getElementById('nav'); /* Seleciona o elemento de navegação */
  nav.classList.toggle('active'); /* Alterna a classe ativa no elemento de navegação */
  const active = nav.classList.contains('active'); /* Verifica se a classe ativa está presente */
  event.currentTarget.setAttribute('aria-expanded', active); /* Define o atributo aria-expanded no botão de menu */
  if (active) {
    event.currentTarget.setAttribute('aria-label', 'Fechar Menu'); /* Define o rótulo do botão de menu quando o menu está aberto */
  } else {
    event.currentTarget.setAttribute('aria-label', 'Abrir Menu'); /* Define o rótulo do botão de menu quando o menu está fechado */
  }
}

btnMobile.addEventListener('click', toggleMenu); /* Adiciona um ouvinte de evento para abrir/fechar o menu ao clicar no botão */
btnMobile.addEventListener('touchstart', toggleMenu); /* Adiciona um ouvinte de evento para abrir/fechar o menu ao tocar no botão em dispositivos móveis */
