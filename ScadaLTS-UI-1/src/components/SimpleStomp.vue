<template>
  <div>
    <p>{{label}}</p>
    <p>{{queue}}</p>
    <p>{{invokeIdCnt}}</p>
    <button v-on:click="connectSrv()">connect</button>
  </div>
</template>
<script>
  //import VueStomp from "vue-stomp";
  export default {
    props: ['pqueue', 'plabel'],
    data () {
      return {
        invokeIdCnt: 0,
        label: this.plabel,
        queue: this.pqueue,
        monitorIntervalTime: 100,
        stompReconnect: true,
      }
    },
    methods: {
      onConnected(frame){
        console.log('Connected: ' + frame);
        //...
        this.$stompClient.subscribe('/topic/test', this.responseCallback, this.onFailed);
      },
      onFailed(frame){
        console.log('Failed: ' + frame);
      //...
      },
      connectSrv(){
        var headers = {
          "login": 'guest',
          "passcode": 'guest',
          // additional header
          //...
        };
        this.connetWM(headers, this.onConnected, this.onFailed);
      },
      getInvokeId(){
        let hex = (this.invokeIdCnt++ ).toString(16);
        var zero = '0000';
        var tmp  = 4-hex.length;
        return zero.substr(0,tmp) + hex;
      },
      send(){
        let destination = '/topic/test'
        let invokeId = this.getInvokeId();
        //...
        let body = msgHead + invokeId + msgBody;
        this.sendWM(destination, body, invokeId, this.responseCallback, 3000);
      },
      responseCallback(frame){
        console.log("responseCallback msg=>" + frame.body);
        let invokeId = frame.body.substr(invokeIdIndex, 4);
        this.removeStompMonitor(invokeId);
      },
      disconnect(){
        this.disconnetWM();
      }
    },
    stompClient:{
      monitorIntervalTime: 100,
      stompReconnect: true,
      timeout(orgCmd) {
      //...
      }
    }
  };

</script>
<style>

</style>
