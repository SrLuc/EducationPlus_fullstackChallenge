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
                            <form class="form" action="">
                                <div class="form-section">
                                    <label for="name">Nome:</label>
                                    <input type="text" required>
                                </div>
                                <div>
                                    <label for="cpf">CPF:</label>
                                    <input type="text" required>
                                </div>
                                <div>
                                    <label for="email">Email:</label>
                                    <input type="text" required>
                                </div>

                            </form>
                        </div>
                        <div class="btn-container">
                            <v-btn class="closeBtn" @click="dialog = false">
                                Fechar
                            </v-btn>

                            <button class="salvBtn" type="submit">Salvar</button>
                        </div>
                    </v-spacer>


                </template>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>
export default {
    props: {
        content: {
            type: String,
            required: true
        }
    },
    data() {
        return {
            dialog: false,
        }
    },
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