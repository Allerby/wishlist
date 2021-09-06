<template>
  <ul>
    <li v-for="present in orderedPresents" :key="present.name" class="mb-8">
      <present :present="present" :placeholder="placeholder" />
    </li>
  </ul>
</template>

<script>
  import { orderBy } from 'lodash'
  export default {
    props: ['presents', 'placeholder'],
    computed: {
      orderedPresents() {
        return orderBy(this.presents, 'created_at', 'desc');
      }
    }
  }
</script>