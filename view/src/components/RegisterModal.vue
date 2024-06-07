<template>
    <div class="text-center pa-4">
        <v-dialog v-model="dialog" max-width="400" persistent>
            <template v-slot:activator="{ props: activatorProps }">
                <v-btn v-bind="activatorProps">
                    {{ content }}
                </v-btn>
            </template>
            <v-card prepend-icon="mdi-map-marker"
                text="Por favor, preencha o formulário abaixo para cadastrar um novo aluno." title="Cadastrar Aluno">
                <template v-slot:actions>
                    <v-spacer>
                        <div class="form-container">
                            <form class="form" @submit.prevent="submitForm">
                                <div class="form-section">
                                    <label for="name">Nome:</label>
                                    <input type="text" v-model="form.name" placeholder="Nome Completo" required>
                                </div>
                                <div>
                                    <label for="age">Idade</label>
                                    <input type="number" v-model="form.age" placeholder="Idade" required>
                                </div>
                                <div>
                                    <label for="cpf">CPF:</label>
                                    <input type="text" v-model="form.cpf" placeholder="EX: 123.456.789-10" required>
                                </div>
                                <div>
                                    <label for="email">Email:</label>
                                    <input type="email" v-model="form.email" placeholder="isacnewton@mail.com" required>
                                </div>
                                <button type="submit" class="registerBtn">Salvar</button>
                            </form>
                        </div>
                        <div class="btn-container">
                            <v-btn class="closeBtn" @click="dialog = false">
                                Fechar
                            </v-btn>
                        </div>
                    </v-spacer>
                </template>
            </v-card>
        </v-dialog>
    </div>
</template>

<script setup>
import axios from 'axios';
import { ref } from 'vue';

const props = defineProps({
    content: {
        type: String,
        required: true
    }
});

const form = ref({
    name: '',
    age: '',
    cpf: '',
    email: ''
});

const dialog = ref(false);

function validateCpf(cpf) {
    const cpfRegex = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/;
    return cpfRegex.test(cpf);
}

async function submitForm() {
    if (!validateCpf(form.value.cpf)) {
        alert('CPF inválido! Por favor, insira um CPF válido.');
        return;
    }

    try {
        const response = await axios.post('http://localhost:9999/students', form.value);
        console.log('Aluno cadastrado com sucesso:', response.data);
        alert('Aluno cadastrado com sucesso!');
        dialog.value = false; // Fechar o diálogo após o cadastro
    } catch (error) {
        console.error('Erro ao cadastrar aluno:', error);
    }
}

</script>

<style scoped>
.salvBtn {
    background-color: #4CAF50;
    color: white;
    padding: 5px 11px;
    border: none;
    border-radius: 5px;
    letter-spacing: 1px;
}

.closeBtn {
    background-color: #f44336;
    color: white;
}

.registerBtn {
    background-color: #2a752cda;
    color: white;
    padding: 5px 11px;
    border: none;
    border-radius: 5px;
    letter-spacing: 1px;
}

.form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    margin: 20px;
}

.btn-container {
    display: flex;
    justify-content: right;
    gap: 20px;
}

input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

label {
    font-size: 15px;
}
</style>
