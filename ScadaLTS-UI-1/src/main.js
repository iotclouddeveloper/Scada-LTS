// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import Test from './components/Test'
import ExportImportPointHierarchy from './components/ExportImportPointHierarchy'
import SimpleComponentSVG from './components/SimpleComponentSVG'
import SimpleStomp from './components/SimpleStomp'
import router from './router'
import VJsoneditor from 'vue-jsoneditor';
import Vuetify from 'vuetify';
import VueStomp from "vue-stomp";


Vue.config.productionTip = false
Vue.use(VJsoneditor);
Vue.use(Vuetify);
Vue.use(VueStomp, 'http://' + window.location.hostname + ':15674/stomp');

/*eslint-disable no-new */
new Vue({
  el: '#app1',
  router,
  components: { App },
  template: '<App/>'
})


new Vue({
  el: '#test',
  components: { Test },
  template: '<Test/>'
})


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
     "simple-stomp": SimpleStomp
   }
})
