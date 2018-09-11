<template>
  <div>
    <p>{{label}}</p>
    <p>{{queue}}</p>
    <p>{{invokeIdCnt}}</p>
    <button v-on:click="connectWebSocket()">connect</button>
  </div>
</template>
<script>
  import SockJS from "sockjs-client";
  import Stomp from "webstomp-client";

  export default {
    //pserverEndPoint 'http://' + window.location.hostname + ':15674/stomp';
    props: ['pqueue', 'plabel'],
    data() {
      return {
        label: this.plabel,
        queue: this.pqueue,
        stompClient: {}
      }
    },
    methods: {
      connectWebSocket() {
        let url = 'http://localhost:15670/stomp',
          login = 'guest', password = 'guest';

        let socket = new SockJS(url, {heartbeat: false});

        this.stompClient = Stomp.over(socket);
        this.stompClient.connect(login, password, this.onConnect(), this.onError())
      },
      onConnect() {
        this.stompClient.subscribe('/topic/webstomp-chat-example', this.onMessage.bind(this));
      },
      onMessage(msg) {
        console.log(msg);
      },
      onSend(msg) {
        this.stompClient.send('/topic/webstomp-chat-example', msg);
      },
      onError(err){
        console.log(err);
      }
    }
  };

</script>
<style>

</style>
