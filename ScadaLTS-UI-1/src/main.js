// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'bootstrap/dist/css/bootstrap.min.css'

import Vue from 'vue'
import App from './App'
import ExportImportPointHierarchy from './components/ExportImportPointHierarchy'
import SimpleComponentSVG from './components/SimpleComponentSVG'
import router from './router'
import VJsoneditor from 'vue-jsoneditor';
import Vuetify from 'vuetify';
import * as uiv from 'uiv';

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
     "export-import-ph": ExportImportPointHierarchy
   }
})
