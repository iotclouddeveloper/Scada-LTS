// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'bootstrap/dist/css/bootstrap.min.css'


import Vue from 'vue'
import App from './App'
import router from './router'

// Import components use in old UI Scada-LTS
import ExportImportPointHierarchy from './components/ExportImportPointHierarchy'
import SimpleComponentSVG from './components/SimpleComponentSVG'

// Import external components
import VJsoneditor from 'vue-jsoneditor';
import Vuetify from 'vuetify';
import * as uiv from 'uiv';

// Import components use in new UI Scada-LTS
import Permission from './module/permission/Permission'

Vue.config.productionTip = false
Vue.use(VJsoneditor);
Vue.use(Vuetify);
Vue.use(uiv);

new Vue({
  el: '#export-import-ph',
  components: { ExportImportPointHierarchy },
  template: '<ExportImportPointHierarchy/>'
})


new Vue({
   el: '#app',
   components: {
     "simple-component-svg": SimpleComponentSVG,
     "export-import-ph": ExportImportPointHierarchy,
     "permission": Permission
   }
})
