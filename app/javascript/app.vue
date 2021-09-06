<template>
</template>

<script>
import { concat, first } from 'lodash'

export default {
  props: ['presents'],
  data() {
    return {
      allPresents: this.allPresents,
      imageUrl: null,
    }
  },
  created() {
    this.allPresents = this.presents;
  },
  methods: {
    addPresent(body, model) {
      this.allPresents = concat(this.allPresents, body)
      model.name = ""
    },
    async getImage(model) {
      const clientId = '6rq7jWblxfl1e6_RefEnJXprCQYGjp43vqjr9DJGtZA'
      const imageCount = '1'
      const url = `https://api.unsplash.com/photos/random/?count=${imageCount}&client_id=${clientId}&query=${model.name}`
      var opts = {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        },
      };
      let apiResponse = await fetch(url, opts)
      let responseJson = await apiResponse.json()
      return model.image_path = first(responseJson).urls.regular
    }
  }
}
</script>
