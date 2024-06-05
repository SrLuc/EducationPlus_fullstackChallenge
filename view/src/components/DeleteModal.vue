<template>
    <div class="text-center pa-4">
        <v-dialog v-model="dialog" max-width="400" persistent>
            <template v-slot:activator="{ props: activatorProps }">
                <v-btn v-bind="activatorProps">
                    {{ content }}
                </v-btn>
            </template>

            <v-card :text="`Deseja excluir o Aluno? ${studentName}`" title="Deletar Aluno">
                <template v-slot:actions>
                    <v-spacer>
                        <div class="form-container"></div>
                        <div class="btn-container">
                            <v-btn class="closeBtn" @click="dialog = false">
                                Voltar
                            </v-btn>
                            <v-btn class="salvBtn" @click="handleDelete">
                                Sim
                            </v-btn>
                        </div>
                    </v-spacer>
                </template>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            dialog: false,
        }
    },
    props: {
        content: {
            type: String,
            required: true
        },
        studentID: {
            type: Number,
            required: true
        },
        studentName: {
            type: String,
            required: true
        }
    },
    methods: {
        handleDelete() {
            alert(`Estudante ${this.studentName} deletado com sucesso!`);
            axios.delete(`http://localhost:9999/students/${this.studentID}`)
                .then(response => {
                    this.dialog = false;
                    this.$emit('deleteStudent', this.studentID);
                })
                .catch(error => {
                    console.log(error);
                    alert('Ocorreu um erro ao tentar excluir o aluno.');
                });
        }
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

.form-container {
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
