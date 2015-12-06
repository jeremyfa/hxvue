package vue;

import js.html.HtmlElement;

#if nodejs
@:jsRequire('vue')
#end
extern class Vue {

    /// Typed/Dynamic `this` context

        /** Get `this` typed as current view model (Vue instance) */
    public static var vm(get,null):Vue;
    private static inline function get_vm():Vue { return untyped __js__('this'); }

        /** Get `this` typed as current directive instance */
    public static var dir(get,null):DirectiveInstance;
    private static inline function get_dir():DirectiveInstance { return untyped __js__('this'); }

        /** Get `this` typed as dynamic instance (no type restriction).
            Useful to call/get any method or data from final vm/directive instance,
            including mixins and custom components values. */
    public static var self(get,null):Dynamic;
    private static inline function get_self():Dynamic { return untyped __js__('this'); }

    /// Instance properties

        /** The data object that the Vue instance is observing. You can swap it with a new object.
            The Vue instance proxies access to the properties on its data object. */
    @:native('$data')
    public var data:Dynamic<Dynamic>;

        /** The DOM element that the Vue instance is managing. Note that for Fragment Instances,
            `vm.el` will return an anchor node that indicates the starting position of the fragment. */
    @:native('$el')
    public var el(default,null):HtmlElement;

        /** The instantiation options used for the current Vue instance.
            This is useful when you want to include custom properties in the options. */
    @:native('$options')
    public var options(default,null):Dynamic;

        /** The parent instance, if the current instance has one. */
    @:native('$parent')
    public var parent(default,null):Vue;

        /** The root Vue instance of the current component tree. If the current instance
            has no parents this value will be itself. */
    @:native('$root')
    public var root(default,null):Vue;

        /** The direct child components of the current instance. */
    @:native('$children')
    public var children(default,null):Array<Vue>;

        /** An object that holds child components that have `v-ref` registered. */
    @:native('$refs')
    public var refs(default,null):Dynamic;

        /** An object that holds DOM elements that have `v-el` registered. */
    @:native('$els')
    public var els(default,null):Dynamic;

    /// Instance methods / Data

        /** Watch an expression or a computed function on the Vue instance for changes.
            The callback gets called with the new value and the old value.
            The expression can be a single keypath or any valid binding expressions. */
    @:native('$watch')
    @:overload(function(func:Void->Dynamic, callback:Dynamic->Void, ?options:WatchOptions):Void { })
    @:overload(function(func:Void->Dynamic, callback:Dynamic->Dynamic->Void, ?options:WatchOptions):Void { })
    @:overload(function(expression:String, callback:Dynamic->Void, ?options:WatchOptions):Void { })
    public function watch(expression:String, callback:Dynamic->Dynamic->Void, ?options:WatchOptions):Void;

        /** Retrieve a value from the Vue instance given an expression.
            Expressions that throw errors will be suppressed and return `null`. */
    @:native('$get')
    public function get(expression:String):Dynamic;

        /** Set a data value on the Vue instance given a valid keypath. In most cases you should prefer
            setting properties using plain object syntax, e.g. `vm.a.b = 123`. */
    @:native('$set')
    public function set(keypath:String, value:Dynamic):Void;

        /** Delete a root level property on the Vue instance (and also its `data`).
            Forces a digest cycle. Not recommended. */
    @:native('$delete')
    public function delete(key:String):Void;

        /** Evaluate a valid binding expression on the current instance.
            The expression can also contain filters. */
    @:native('$eval')
    public function eval(expression:String):Dynamic;

        /** Evaluate a piece of template string containing mustache interpolations.
            Note that this method simply performs string interpolation; attribute directives are ignored. */
    @:native('$interpolate')
    public function interpolate(template:String):String;

        /** Log the current instance data as a plain object, which is more inspection-friendly
            than a bunch of getter/setters. Also accepts an optional key/keypath. */
    @:native('$log')
    public function log(?keypath:String):Dynamic;

    /// Instance methods / Events

        /** Listen for a custom event on the current vm. Events can be triggered by `vm.emit`, `vm.dispatch` or `vm.broadcast`.
            The callback will receive all the additional arguments passed into these event-triggering methods. */
    @:native('$on')
    @:overload(function(event:String, callback:Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    public function on(event:String, callback:Dynamic->Void):Void;

        /** Listen for a custom event, but only once. The listener will be removed once it triggers for the first time. */
    @:native('$once')
    @:overload(function(event:String, callback:Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    @:overload(function(event:String, callback:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Void):Void { })
    public function once(event:String, callback:Dynamic->Void):Void;

        /** Remove event listener(s). If no arguments are provided, remove all event listeners.
            If only the event is provided, remove all listeners for that event. If both event and callback
            are given, remove the listener for that specific callback only. */
    @:native('$off')
    public function off(?event:String, ?callback:Dynamic):Void;

        /** Trigger an event on the current instance. Any additional arguments will be
            passed into the listener’s callback function. */
    @:native('$emit')
    public function emit(event:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic, ?arg6:Dynamic, ?arg7:Dynamic, ?arg8:Dynamic):Void;

        /** Dispatch an event, first triggering it on the instance itself, and then propagates
            upward along the parent chain. The propagation stops when it triggers a parent event listener,
            unless that listener returns `true`. Any additional arguments will be passed into
            the listener’s callback function. */
    @:native('$dispatch')
    public function dispatch(event:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic, ?arg6:Dynamic, ?arg7:Dynamic, ?arg8:Dynamic):Void;

        /** Broadcast an event that propagates downward to all descendants of the current instance.
            Since the descendants expand into multiple sub-trees, the event propagation will follow
            many different “paths”. The propagation for each path will stop when a listener callback
            is fired along that path, unless the callback returns `true`. */
    @:native('$broadcast')
    public function broadcast(event:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic, ?arg6:Dynamic, ?arg7:Dynamic, ?arg8:Dynamic):Void;

    /// Instance methods / DOM

        /** Append the Vue instance’s DOM element or fragment to target element.
            The target can be either an element or a querySelector string. This method will
            trigger transitions if present. The callback is fired after the transition has completed
            (or immediately if no transition has been triggered). */
    @:native('$appendTo')
    @:overload(function(selector:String, callback:Void->Void):Vue { })
    public function appendTo(element:HtmlElement, ?callback:Void->Void):Vue;

        /** Insert the Vue instance’s DOM element or fragment before target element.
            The target can be either an element or a querySelector string. This method will
            trigger transitions if present. The callback is fired after the transition has completed
            (or immediately if no transition has been triggered). */
    @:native('$before')
    @:overload(function(selector:String, callback:Void->Void):Vue { })
    public function before(element:HtmlElement, ?callback:Void->Void):Vue;

        /** Insert the Vue instance’s DOM element or fragment after target element.
            The target can be either an element or a querySelector string. This method will
            trigger transitions if present. The callback is fired after the transition has completed
            (or immediately if no transition has been triggered). */
    @:native('$after')
    @:overload(function(selector:String, callback:Void->Void):Vue { })
    public function after(element:HtmlElement, ?callback:Void->Void):Vue;

        /** Remove the Vue instance’s DOM element or fragment from the DOM. This method will
            trigger transitions if present. The callback is fired after the transition has completed
            (or immediately if no transition has been triggered). */
    @:native('$remove')
    public function remove(?callback:Void->Void):Vue;

        /** Defer the callback to be executed after the next DOM update cycle.
            Use it immediately after you’ve changed some data to wait for the DOM update.
            This is the same as the global `Vue.nextTick`, except that the callback’s `this`
            context is automatically bound to the instance calling this method. */
    @:native('$nextTick')
    public function next(callback:Void->Void):Void;

    /// Instance methods / Lifecycle

        /** If a Vue instance didn’t receive the `el` option at instantiation, it will be in "unmounted" state,
            without an associated DOM element or fragment. `vm.mount()` can be used to manually start the mounting/compilation of an unmounted Vue instance. */
    @:native('$mount')
    @:overload(function(selector:String):Vue { })
    public function mount(element:HtmlElement):Vue;

        /** Completely destroy a vm. Clean up its connections with other existing vms, unbind all its directives,
            turn off all event listeners and, if the `remove` argument is true, remove its associated DOM element
            or fragment from the DOM.
            Triggers the beforeDestroy and destroyed hooks. */
    @:native('$destroy')
    public function destroy(?remove:Bool):Vue;

    /// Constructor

        /** Constructor */
    function new(options:VueInstanceOptions);

    /// Config

        /** An object containing Vue’s global configurations.
            You can modify its properties before bootstrapping the application. */
    static var config:VueConfig;

    /// Global API

        /** Instanciate a new view model (Vue instance) from
            the given component (Vue subclass) and options. */
    static inline function create(component:Class<Vue>, options:VueInstanceOptions):Vue {
        return Type.createInstance(component, [options]);
    }

        /** Create a `subclass` of the base Vue constructor.
            The special cases to note here are el and data options:
            they must be functions when used with Vue.extend(). */
    static function extend(options:Component):Class<Vue>;

        /** Defer the callback to be executed after the next DOM update cycle.
            Use it immediately after you’ve changed some data to wait for the DOM update. */
    static function nextTick(callback:Void->Void):Void;

        /** Set a property on an object. If the object is reactive, ensure the property is created
            as a reactive property and trigger view updates. This is primarily used to get around
            the limitation that Vue cannot detect property additions. */
    @:native('set')
    static function setOnObject(object:Dynamic, key:String, value:Dynamic):Void;

        /** Delete a property on an object. If the object is reactive, ensure the deletion triggers view updates.
            This is primarily used to get around the limitation that Vue cannot detect property deletions,
            but you should rarely need to use it. */
    @:native('delete')
    static function deleteOnObject(object:Dynamic, key:String):Void;

        /** Register or retrieve a global directive. */
    @:overload(function(id:String):Directive { })
    @:overload(function(id:String, update:Void->Void):Void { })
    @:overload(function(id:String, update:Dynamic->Void):Void { })
    @:overload(function(id:String, update:Dynamic->Dynamic->Void):Void { })
    static function directive(id:String, definition:Directive):Void;

        /** In some cases, we may want our directive to be used in the form of a custom element rather than as an attribute.
            This is very similar to Angular’s notion of 'E' mode directives.
            Element directives provide a lighter-weight alternative to full-blown components */
    @:overload(function(id:String):Directive { })
    static function elementDirective(id:String, definition:Directive):Void;

        /** Register or retrieve a global filter */
    @:overload(function(id:String, definition:Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    @:overload(function(id:String, definition:Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic->Dynamic):Void { })
    static function filter(id:String, definition:TwoWayFilterDefinition):Void;

        /** Register or retrieve a global component. */
    @:overload(function(id:String):Class<Vue> { })
    @:overload(function(id:String, definition:Class<Vue>):Void { })
    static function component(id:String, definition:Component):Void;

        /** Register or retrieve a global transition hooks object. */
    @:overload(function(id:String):TransitionHooks { })
    static function transition(id:String, hooks:TransitionHooks):Void;

        /** Register or retrieve a global template partial string. */
    @:overload(function(id:String):String { })
    static function partial(id:String, partial:String):Void;

        /** Install a `Vue.js` plugin. If the plugin is an Object, it must expose an install method.
            If it is a function itself, it will be treated as the install method.
            The install method will be called with Vue as the argument. */
    static function use(plugin:Dynamic, ?options:Dynamic):Void;

        /** Apply a mixin globally, which affects every Vue instance created afterwards.
            This can be used by plugin authors to inject custom behavior into components.
            Not recommended in application code. */
    static function mixin(mixin:Dynamic):Void;

}

/// Config

typedef VueConfig = {

        /** When in debug mode, Vue will:
             1. Print stack traces for all warnings.
             2. Make all anchor nodes visible in the DOM as Comment nodes.
                This makes it easier to inspect the structure of the rendered result.
            Debug mode is only available in development build.
            Default: `false` */
    var debug:Bool;

        /** Change the plain text interpolation delimiters.
            Default: `["{{", "}}"]` */
    var delimiters:Array<String>;

        /** Change the raw HTML interpolation delimiters.
            Default: `["{{{", "}}}"]` */
    var unsafeDelimiters:Array<String>;

        /** Suppress all Vue.js logs and warnings.
            Default: `false` */
    var silent:Bool;

        /** When async mode is off, Vue will perform all DOM updates synchronously
            upon detecting data change. This may help with debugging in some scenarios,
            but could also cause degraded performance and affect the order
            in which watcher callbacks are called.
            Default: `true` (`false` not recommended in production) */
    var async:Bool;

        /** Turning this option on will enable Vue to convert and observe objects that
            already contain getters/setters defined with Object.defineProperty. This is off by default
            because there is a small performance cost and this is not a commonly-needed feature.
            Default: `false` */
    var convertAllProperties:Bool;
}

/// Component

typedef Component = {

    > VueOptions,

    /// Data

        /** The data object factory for the Vue instance.
            Only accepts functions because used with `Vue.extend()` / `Vue.component()`. */
    @:optional var data:Void->Dynamic;

        /** A list/hash of attributes that are exposed to accept data from the parent component.
            It has a simple Array-based syntax and an alternative Object-based syntax that allows
            advanced configurations such as type checking, custom validation and default values. */
    @:optional var props:Dynamic;

    /// Misc

        /** The `mixins` option accepts an array of mixin objects. These mixin objects can contain instance
            options just like normal instance objects, and they will be merged against the eventual options
            using the same option merging logic in `Vue.extend()``. e.g. If your mixin contains a created
            hook and the component itself also has one, both functions will be called. */
    @:optional var mixins:Array<Component>;

}

typedef VueInstanceOptions = {

    > VueOptions,

    /// Data

        /** The data object for the Vue instance. Vue.js will recursively convert its properties
            into getter/setters to make it "reactive". The object must be plain: native objects,
            existing getter/setters and prototype properties are ignored.
            It is not recommended to observe complex objects. */
    @:optional var data:Dynamic;

    /// Misc

        /** The `mixins` option accepts an array of mixin objects. These mixin objects can contain instance
            options just like normal instance objects, and they will be merged against the eventual options
            using the same option merging logic in `Vue.extend()``. e.g. If your mixin contains a created
            hook and the component itself also has one, both functions will be called. */
    @:optional var mixins:Array<VueInstanceOptions>;

}

typedef VueOptions = {

    /// Data

        /** Computed properties to be mixed into the Vue instance. All getters and setters
            have their `this` context automatically bound to the Vue instance. */
    @:optional var computed:Dynamic;

        /** Methods to be mixed into the Vue instance. You can access these methods directly on the VM instance,
            or use them in directive expressions. All methods will have their `this` context automatically bound
            to the Vue instance. */
    @:optional var methods:Dynamic;

        /** An object where keys are expressions to watch and values are the corresponding callbacks.
            The value can also be a string of a method name, or an Object that contains additional options.
            The Vue instance will call `watch()` for each entry in the object at instantiation. */
    @:optional var watch:Dynamic;

    /// DOM

        /** Provide the Vue instance an existing DOM element to mount on. It can be a CSS selector string,
            an actual HTMLElement, or a function that returns an HTMLElement. Note that the provided element merely serves
            as a mounting point; it will be `replaced` if a template is also provided, unless `replace` is set to false.
            The resolved element will be accessible as `vm.el` */
    @:optional var el:Dynamic;

        /** A string template to be used as the markup for the Vue instance.
            By default, the template will replace the mounted element. When the replace option is set to false,
            the template will be inserted into the mounted element instead. In both cases,
            any existing markup inside the mounted element will be ignored, unless content distribution
            slots are present in the template. */
    @:optional var template:String;

        /** Determines whether to replace the element being mounted on with the template.
            If set to `false`, the template will overwrite the element’s inner content
            without replacing the element itself.
            Default: `true` */
    @:optional var replace:Bool;

    /// Lifecycle Hooks

        /** Called synchronously after the instance is created. At this stage, the instance has finished
            processing the options which means the following have been set up:
            data observation, computed properties, methods, watch/event callbacks.
            However, DOM compilation has not been started, and the `el` property will not be available yet. */
    @:optional var created:Void->Void;

        /** Called right before the compilation starts. */
    @:optional var beforeCompile:Void->Void;

        /** Called after the compilation is finished. At this stage all directives have been
            linked so data changes will trigger DOM updates. However, `el` is not guaranteed
            to have been inserted into the document yet. */
    @:optional var compiled:Void->Void;

        /** Called after compilation and the `el` is inserted into the document for the first time,
            i.e. right after the first attached hook. Note this insertion must be executed via Vue
            (with methods like `vm.appendTo()` or as a result of a directive update) to trigger the `ready` hook. */
    @:optional var ready:Void->Void;

        /** Called when `vm.el` is attached to DOM by a directive or a VM instance method such as `appendTo()`.
            Direct manipulation of `vm.el` will not trigger this hook. */
    @:optional var attached:Void->Void;

        /** Called when `vm.el` is removed from the DOM by a directive or a VM instance method.
            Direct manipulation of `vm.el` will not trigger this hook. */
    @:optional var detached:Void->Void;

        /** Called right before a Vue instance is destroyed. At this stage the instance is still fully functional. */
    @:optional var beforeDestroy:Void->Void;

        /** Called after a Vue instance has been destroyed. When this hook is called, all bindings and directives
            of the Vue instance have been unbound and all child Vue instances have also been destroyed. */
    @:optional var destroyed:Void->Void;

    /// Assets

        /** A hash of directives to be made available to the Vue instance. */
    @:optional var directives:Dynamic;

        /** A hash of element directives to be made available to the Vue instance. */
    @:optional var elementDirectives:Dynamic;

        /** A hash of filters to be made available to the Vue instance. */
    @:optional var filters:Dynamic;

        /** A hash of components to be made available to the Vue instance. */
    @:optional var components:Dynamic;

        /** A hash of transitions to be made available to the Vue instance. */
    @:optional var transitions:Dynamic;

        /** A hash of partial strings to be made available to the Vue instance. */
    @:optional var partials:Dynamic;

    /// Misc

        /** Specify the parent instance for the instance to be created. Establishes a parent-child
            relationship between the two. The parent will be accessible as `this._parent` for the child,
            and the child will be pushed into the parent’s `children` array. */
    @:optional var parent:Vue;

        /** An object where keys are events to listen for and values are the corresponding callbacks.
            Note these are Vue events rather than DOM events. The value can also be a string of a method name.
            The Vue instance will call `on()` for each entry in the object at instantiation. */
    @:optional var events:Dynamic;

        /** Allow the component to recursively invoke itself in its template.
            Note that when a component is registered globally with `Vue.component()`,
            the global ID is automatically set as its name. */
    @:optional var name:String;

}

/// Filter

typedef TwoWayFilterDefinition = {

    dynamic function read(val:Dynamic):Dynamic;

    dynamic function write(val:Dynamic, oldVal:Dynamic):Dynamic;

}

/// Directive

typedef Directive = {

        /** Custom directive can provide a `params` array, and the Vue compiler will automatically extract
            these attributes on the element that the directive is bound to. */
    @:optional var params:Array<String>;

        /** Tou can specify a callback when a param value has changed. */
    @:optional var paramWatchers:DirectiveParamWatchers;

        /** If your custom directive is expected to be used on an Object, and it needs to
            trigger update when a nested property inside the object changes, you need to
            pass in `deep: true` in your directive definition. */
    @:optional var deep:Bool;

        /** If your directive expects to write data back to the Vue instance, you need to pass in `twoWay: true`.
            This option allows the use of `this.set(value)` inside the directive. */
    @:optional var twoWay:Bool;

        /** Passing in `acceptStatement: true` enables your custom directive to accept inline statements like v-on does.
            Use this wisely though, because in general you want to avoid side-effects in your templates. */
    @:optional var acceptStatement:Bool;

        /** You can optionally provide a priority number for your directive (defaults to 1000).
            A directive with a higher priority will be processed earlier than other directives on the same element.  */
    @:optional var priority:Int;

        /** Called only once, when the directive is first bound to the element. */
    @:optional dynamic function bind():Void;

        /** Called for the first time immediately after `bind` with the initial value,
            then again whenever the binding value changes. The new value and the previous
            value are provided as the argument. */
    @:optional dynamic function update(newValue:Dynamic, oldValue:Dynamic):Void;

        /** Called only once, when the directive is unbound from the element. */
    @:optional dynamic function unbind():Void;

}

typedef DirectiveParamWatchers = Dynamic<Dynamic->Dynamic->Void>;

extern class DirectiveInstance {

        /** Set data back to the vm. If the directive is bound as v-example="a.b.c",
            this will attempt to set `vm.a.b.c` with the given value. */
    function set(value:Dynamic):Void;

        /** The params[key] value is automatically kept up-to-date. */
    var params(default,null):Dynamic<Bool>;

        /** The HTML element the directive is bound to. */
    var el(default,null):HtmlElement;

        /** The context ViewModel that owns this directive. */
    var vm(default,null):Vue;

        /** The expression of the binding, excluding arguments and filters. */
    var expression(default,null):String;

        /** The argument, if present. */
    var arg(default,null):String;

        /** The name of the directive, without the prefix. */
    var name(default,null):String;

        /** An object containing modifiers, if any. */
    var modifiers(default,null):Dynamic<Bool>;

        /** An object containing the parsing result of the entire directive. */
    var descriptor(default,null):Dynamic;

}

/// Transition

typedef TransitionHooks = {

    @:optional dynamic function beforeEnter(el:HtmlElement):Void;

    @:optional dynamic function enter(el:HtmlElement):Void;

    @:optional dynamic function afterEnter(el:HtmlElement):Void;

    @:optional dynamic function enterCancelled(el:HtmlElement):Void;

    @:optional dynamic function beforeLeave(el:HtmlElement):Void;

    @:optional dynamic function leave(el:HtmlElement):Void;

    @:optional dynamic function afterLeave(el:HtmlElement):Void;

    @:optional dynamic function leaveCancelled(el:HtmlElement):Void;

}

/// Watch

typedef WatchOptions = {

        /** To also detect nested value changes inside Objects, you need to pass in `deep: true`
            in the options argument. Note that you don’t need to do so to listen for Array mutations. */
    @:optional var deep:Bool;

        /** Passing in `immediate: true` in the options will trigger the callback immediately
            with the current value of the expression. */
    @:optional var immediate:Bool;

}
