<template>
    <main>
        <section class="sidebar">
            <h1>Módulo Acadêmico</h1>
            <h2>Alunos</h2>

        </section>
        <div class="container">
            <article class="registerStudents">
                <h1 class="titles">Consulta Alunos</h1>
                <p class="paragraphs">Consulte os alunos cadastrados no sistema</p>
                <input type="text" class="inputs">
                <button class="buttons">Consultar</button>
                <button @click="handleRegister()" class="buttons">
                    <RegisterModal content="Cadastrar Alunos" />
                </button>
            </article>
            <nav class="navigationCells">
                <ul class="studentsList">
                    <li v-if="loading">Carregando...</li>
                    <li v-else v-for="student in students" :key="student.id" class="studentItem">
                        <p class="paragraphs">{{ student.RA }}</p>
                        <p class="paragraphs">{{ student.name }}</p>
                        <p class="paragraphs">{{ student.cpf }}</p>
                        <span>
                            <button @click="handleUpdate()" class="buttons">
                                <UpdateModal content="Atualizar" />
                            </button>
                            <button @click="handleDelete()" class="buttons">
                                <DeleteModal content="Excluir" :studentID="student.id" :studentName="student.name" />
                            </button>
                        </span>
                    </li>
                </ul>
            </nav>
        </div>
    </main>
</template>

<script setup>
// IMPORTS
import { ref, onMounted } from 'vue';
import axios from 'axios';


//Component
import DeleteModal from '../components/DeleteModal.vue';
import RegisterModal from '../components/RegisterModal.vue';
import UpdateModal from '../components/UpdateModal.vue';

// DATA
const students = ref([]);
const loading = ref(true);
const register = ref(true)
const deleteStudent = ref(true)
const update = ref(true)

// METHODS
const fetchAlunos = async () => {
    try {
        console.log('Fetching alunos...');
        const response = await axios.get('http://127.0.0.1:9999/students');
        students.value = response.data;
        console.log('Alunos:', students.value);
        loading.value = false;
    } catch (error) {
        console.error('Erro ao buscar alunos:', error);
    }
};

//Handle Functions
const handleRegister = async () => {
    register.value = !register.value;
}

const handleDelete = async () => {
    deleteStudent.value = !deleteStudent.value;
}

const handleUpdate = async () => {
    update.value = !update.value;
}

// LIFECYCLE
onMounted(fetchAlunos);


</script>

<style scoped>
main {
    display: flex;
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 85%;
    height: 100vh;
    margin: 5px;
}

.sidebar {
    width: 15%;
    height: 100vh;
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    margin: 5px;
}

.registerStudents {
    height: 30%;
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
}

.navigationCells {
    height: 70%;
    padding-top: 10px;

}

.titles {
    font-size: 20px;
    margin: 10px;

}

.paragraphs {
    font-size: 12px;
    margin: 10px;
    text-align: left;
    width: 25%;

}

.inputs {
    width: 30%;
    margin: 10px;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    outline: none;
}

.buttons {
    padding: 2px;
    margin: 5px;
}


.studentsList {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.studentItem {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
}
</style>
