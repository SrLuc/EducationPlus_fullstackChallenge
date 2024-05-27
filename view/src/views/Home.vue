<template>
    <main>
        <section>
            <h1>Módulo Acadêmico</h1>
            <h2>Alunos</h2>
        </section>
        <div>
            <article>
                <h1>Consulta Alunos</h1>
                <p>Consulte os alunos cadastrados no sistema</p>
                <input type="text">
                <button>Consultar</button>
                <button>Cadastrar Aluno</button>
            </article>
            <nav>
                <ul>
                    <li v-for="student in students" :key="student.id">
                        <p>{{ student.RA }}</p>
                        <p>{{ student.name }}</p>
                        <p>{{ student.email }}</p>
                        <span>
                            <button>Editar</button>
                            <button>Excluir</button>
                        </span>
                    </li>
                </ul>
            </nav>
        </div>
    </main>
</template>

<script setup>

import { ref, onMounted } from 'vue'
import axios from 'axios'

const students = ref([]);

const fetchAlunos = async () => {
    try {
        const response = await axios.get('http://127.0.0.1:9999/students');
        students.value = response.data;
        console.log('Alunos:', students.value);
    } catch (error) {
        console.error('Erro ao buscar alunos:', error);
    }
};
onMounted(fetchAlunos);

</script>
    

<style scoped>
main {
    display: flex;
}

section {
    width: 25%;
    height: 100vh;
}

div {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 75%;
    height: 100vh;
}

article {
    height: 30%;
}

nav {
    height: 70%;

}

ul {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

button {
    padding: 2px;

}

li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

span {
    display: flex;
    justify-content: space-between;
    margin: 5px;
}

p {
    width: 25%;
    font-size: 12px;
    text-align: center;
}
</style>