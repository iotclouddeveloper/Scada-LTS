import Vue from 'vue'
import Router from 'vue-router'
import ExportImportPointHierarchy from '../components/ExportImportPointHierarchy'
import SimpleComponentSVG from '../components/SimpleComponentSVG'

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/export-import-ph',
      name: 'Export import point hierarchy',
      component: ExportImportPointHierarchy
    },
    { path: '/simple-component-svg',
      name: 'Simple component SVG',
      component: SimpleComponentSVG
    }
  ]
})
