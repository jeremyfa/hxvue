
import vue.Vue;

import vue.Vue.vm;
import vue.Vue.dir;
import vue.Vue.self;

using StringTools;

class Main {

    public static function main():Void {

        // View-model example
        //

        new Vue({

            el: '#app',

            data: {
                newTodo: '',
                todos: [
                    { text: 'Add some todos' }
                ]
            },

            methods: {

                addTodo: function () {
                    var text = self.newTodo.trim();
                    if (text.length > 0) {
                        self.todos.push({ text: text });
                        self.newTodo = '';
                    }
                },

                removeTodo: function (index) {
                    self.todos.splice(index, 1);
                }
            }
        });


        // Watch example
        //

        var vm = new Vue({
            data: {
                firstName: 'Foo',
                lastName: 'Bar',
                fullName: 'Foo Bar'
            }
        });

        vm.watch('firstName', function (val) {
            self.fullName = val + ' ' + self.lastName;
        });

        vm.watch('lastName', function (val) {
            self.fullName = self.firstName + ' ' + val;
        });

        // keypath
        vm.watch('a.b.c', function (newVal, oldVal) {
            // do something
        });

        // expression
        vm.watch('a + b', function (newVal, oldVal) {
            // do something
        });

        // function
        vm.watch(
            function () {
                return self.a + self.b;
            },
            function (newVal, oldVal) {
                // do something
            }
        );


        // Directive example
        //

        Vue.directive('my-directive', {

            bind: function () {
                // do preparation work
                // e.g. add event listeners or expensive stuff
                // that needs to be run only once
            },

            update: function (newValue, oldValue) {
                // do something based on the updated value
                // this will also be called for the initial value
            },

            unbind: function () {
                // do clean up work
                // e.g. remove event listeners added in bind()
            }

        }); //my-directive

    }

}
