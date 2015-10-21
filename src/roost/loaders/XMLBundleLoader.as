package roost.loaders {
    import deng.fzip.FZip;
    import deng.fzip.FZipErrorEvent;
    import deng.fzip.FZipEvent;
    import deng.fzip.FZipFile;

    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;

    import starling.events.Event;
    import starling.events.EventDispatcher;

    public class XMLBundleLoader extends EventDispatcher implements IBundleLoader {
        public function XMLBundleLoader() {
            _bundleList = new <String>[];
            _loader = new FZip();
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
            _loader.addEventListener(FZipErrorEvent.PARSE_ERROR, onError);
            _loader.addEventListener(flash.events.Event.COMPLETE, onLoadComplete);
            _loader.addEventListener(FZipEvent.FILE_LOADED, onParsingComplete);
        }

        private var _bundleList:Vector.<String>;
        private var _loader:FZip;
        private var _loadInProgress:Boolean;
        private var _currentBundleName:String;

        public function addTemplatesBundle(path:String):IBundleLoader {
            if (_bundleList.indexOf(path) != -1) {
                trace("Bundle already in load list!");
            } else {
                _bundleList.push(path);
            }
            return this;
        }

        public function load():void {
            if (!_loadInProgress) {
                startToLoad();
            }
        }

        private function startToLoad():void {
            if (_bundleList.length) {
                _loadInProgress = true;
                _currentBundleName = _bundleList.shift();
                _loader.load(new URLRequest(_currentBundleName));
            } else {
                _currentBundleName = null;
                dispatchEventWith(starling.events.Event.COMPLETE);
            }
        }

        private function parseBundle(file:FZipFile):void {
            trace(">> parse file", file.filename);
        }

        private function onError(event:*):void {
            _loadInProgress = false;
            dispatchEventWith(starling.events.Event.IO_ERROR, false, "Can't load bundle '" + _currentBundleName + "'.");
            startToLoad();
        }

        private function onLoadComplete(event:flash.events.Event):void {
            _loadInProgress = false;
            startToLoad();
        }

        private function onParsingComplete(event:FZipEvent):void {
            parseBundle(event.file);
        }
    }
}
