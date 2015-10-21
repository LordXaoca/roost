package roost {
    import roost.loaders.IBundleLoader;
    import roost.loaders.XMLBundleLoader;
    import roost.templates.TemplatesManager;

    public class Roost {

        private static var _instance:Roost;

        public static function get templates():TemplatesManager {
            return _instance._templatesManager;
        }

        /**
         * Load template bundle.
         *
         * @param path Path to bundle
         */
        public static function addTemplatesBundle(path:String):IBundleLoader {
            return _instance._bundleLoader.addTemplatesBundle(path);
        }

        public static function setup():void {
            if (_instance == null) {
                _instance = new Roost();
            }

        }

        public function Roost() {
            if (_instance != null) {
                // TODO: throw exception
            } else {
                _bundleLoader = new XMLBundleLoader();
                _templatesManager = new TemplatesManager();
            }
        }

        private var _bundleLoader:IBundleLoader;
        private var _templatesManager:TemplatesManager;
    }
}
