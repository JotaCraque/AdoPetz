function limparCampos(form) {
    var inputs = form.getElementsByTagName('input');
    var selects = form.getElementsByTagName('select');

    // Limpa todos os campos de texto, email, telefone, senha e data
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].type === 'text' || inputs[i].type === 'email' || inputs[i].type === 'tel' || inputs[i].type === 'password' || inputs[i].type === 'date') {
            inputs[i].value = '';
        }
    }

    // Limpa todos os campos de seleção
    for (var j = 0; j < selects.length; j++) {
        selects[j].selectedIndex = 0;
    }
}

function alterarFormulario() {
    var pessoaFisica = document.getElementById("pessoaFisica").checked;
    var formPessoaFisica = document.getElementById("formPessoaFisica");
    var formPessoaJuridica = document.getElementById("formPessoaJuridica");

    if (pessoaFisica) {
        formPessoaFisica.style.display = "block";
        formPessoaJuridica.style.display = "none";
        limparCampos(formPessoaJuridica);
    } else {
        formPessoaFisica.style.display = "none";
        formPessoaJuridica.style.display = "block";
        limparCampos(formPessoaFisica);
    }
}

function formatarCPF(cpf) {
    // Limita a quantidade de caracteres
    cpf.value = cpf.value.slice(0, 14); // CPF: XXX.XXX.XXX-XX (14 caracteres)

    // Formata o CPF
    cpf.value = cpf.value.replace(/\D/g, '') // Remove caracteres não numéricos
                        .replace(/(\d{3})(\d)/, '$1.$2')
                        .replace(/(\d{3})(\d)/, '$1.$2')
                        .replace(/(\d{3})(\d{1,2})$/, '$1-$2');
}

function formatarCNPJ(cnpj) {
    // Limita a quantidade de caracteres
    cnpj.value = cnpj.value.slice(0, 18); // CNPJ: XX.XXX.XXX/XXXX-XX (18 caracteres)

    // Formata o CNPJ
    cnpj.value = cnpj.value.replace(/\D/g, '') // Remove caracteres não numéricos
                        .replace(/(\d{2})(\d)/, '$1.$2')
                        .replace(/(\d{3})(\d)/, '$1.$2')
                        .replace(/(\d{3})(\d)/, '$1/$2')
                        .replace(/(\d{4})(\d{1,2})$/, '$1-$2');
}

function formatarTelefone(telefone) {
    // Limita a quantidade de caracteres
    telefone.value = telefone.value.slice(0, 15); // Telefone: (XX) XXXXX-XXXX (15 caracteres)

    // Formata o telefone
    telefone.value = telefone.value.replace(/\D/g, '') // Remove caracteres não numéricos
                                  .replace(/(\d{2})(\d)/, '($1) $2')
                                  .replace(/(\d{5})(\d)/, '$1-$2')
                                  .replace(/(\d{4})-(\d{4})$/, '$1-$2');
}

function formatarCEP(cep) {
    // Limita a quantidade de caracteres
    cep.value = cep.value.slice(0, 9); // CEP: XXXXX-XXX (9 caracteres)

    // Formata o CEP
    cep.value = cep.value.replace(/\D/g, '')
                        .replace(/(\d{5})(\d)/, '$1-$2')
                        .replace(/(-\d{3})\d+?$/, '$1');
}

document.addEventListener("DOMContentLoaded", function() {
    alterarFormulario();

    // Adiciona event listeners para formatação dos campos
    var cpfInput = document.getElementById('cpfPF');
    var cnpjInput = document.getElementById('cnpjPJ');
    var telefonePFInput = document.getElementById('telefonePF');
    var telefonePJInput = document.getElementById('telefonePJ');
    var cepPFInput = document.getElementById('cepPF');
    var cepPJInput = document.getElementById('cepPJ');

    if (cpfInput) {
        cpfInput.addEventListener('input', function() {
            formatarCPF(this);
        });
    }

    if (cnpjInput) {
        cnpjInput.addEventListener('input', function() {
            formatarCNPJ(this);
        });
    }

    if (telefonePFInput) {
        telefonePFInput.addEventListener('input', function() {
            formatarTelefone(this);
        });
    }

    if (telefonePJInput) {
        telefonePJInput.addEventListener('input', function() {
            formatarTelefone(this);
        });
    }

    if (cepPFInput) {
        cepPFInput.addEventListener('input', function() {
            formatarCEP(this);
        });
    }

    if (cepPJInput) {
        cepPJInput.addEventListener('input', function() {
            formatarCEP(this);
        });
    }
});
