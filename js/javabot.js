
function openChat() {
    document.getElementById('chat-modal').style.display = 'flex';
}


function closeChat() {
    document.getElementById('chat-modal').style.display = 'none';
}


function sendMessage() {
    const userInput = document.getElementById('user-input').value;
    if (userInput) {
        const chatBox = document.getElementById('chat-box');
        
        
        const userMessage = document.createElement('div');
        userMessage.className = 'message user';
        userMessage.textContent = userInput;
        chatBox.appendChild(userMessage);

        
        document.getElementById('user-input').value = '';

        
        const botResponse = getBotResponse(userInput);
        const botMessage = document.createElement('div');
        botMessage.className = 'message bot';
        botMessage.textContent = botResponse;
        chatBox.appendChild(botMessage);

        
        chatBox.scrollTop = chatBox.scrollHeight;
    }
}


function getBotResponse(userInput) {
    const lowerCaseInput = userInput.toLowerCase();
    
    
    const responses = {
        'oi': 'Olá! Como posso ajudar você hoje?',
        'ajuda': 'Claro! O que você precisa saber?',
        'obrigado': 'De nada! Se precisar de mais ajuda, estou aqui.',
        'default': 'Desculpe, não entendi sua pergunta. Pode reformular?'
    };
    
    
    return responses[lowerCaseInput] || responses['default'];
}


document.addEventListener('DOMContentLoaded', function() {
    const faqList = document.getElementById('faq-list');
    const faqs = [
        { question: 'Como posso entrar em contato com o suporte?', answer: 'Você pode entrar em contato conosco pelo e-mail AdoPets@ooo.com.' },
        { question: 'Posso devolver o pet que eu adotei?', answer: 'ABlalalalalaa' },
        { question: 'Onde posso encontrar mais informações sobre os animais?', answer: 'AKNASJBDASHBDJAHSBDad' },
        { question: 'Vocês tem loja fisíca?', answer: 'AKNASJBDASHBDJAHSBDad' }
    ];

    faqs.forEach(faq => {
        const faqItem = document.createElement('div');
        faqItem.className = 'faq-item';
        faqItem.textContent = faq.question;
        faqItem.onclick = () => {
            const chatBox = document.getElementById('chat-box');
            
            
            const userMessage = document.createElement('div');
            userMessage.className = 'message user';
            userMessage.textContent = faq.question;
            chatBox.appendChild(userMessage);

            
            const botMessage = document.createElement('div');
            botMessage.className = 'message bot';
            botMessage.textContent = faq.answer;
            chatBox.appendChild(botMessage);
            
            
            chatBox.scrollTop = chatBox.scrollHeight;
        };
        faqList.appendChild(faqItem);
    });
});
