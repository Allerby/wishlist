<template>
  <form v-on:submit="formSubmit">
    <slot :model="model"></slot>
  </form>
</template>

<script>
  export default {
    props: ['formUrl', 'formAction', 'onSuccess', 'submitAction'],
    data() {
      return {
        isSaved: false,
        model: {},
      }
    },
    methods: {
      async formSubmit(e) {
        e.preventDefault();
        let onSubmitValue = await this.submitAction(this.model)
        
        var opts = {
          method: this.formAction,      
          headers: {
            'X-CSRF-TOKEN': this.$http.headers.common['X-CSRF-Token'],
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.model)
        };
        fetch(this.formUrl, opts).then((response) => {
          return response.json();
        })
        .then((body) => {
          this.onSuccess(body, this.model)
        });
      }
    }
  }
</script>
