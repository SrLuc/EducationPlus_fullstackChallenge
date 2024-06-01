import "../src/assets/css/global.css";

//App
import App from "./App.vue";
import { createApp } from "vue";
import router from "./router";

// Vuetify
import "vuetify/styles";
import { createVuetify } from "vuetify";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";

// Create App
const app = createApp(App);
const vuetify = createVuetify({
  components,
  directives,
});

// middlewares
app.use(router);
app.use(vuetify);
app.mount("#app");
