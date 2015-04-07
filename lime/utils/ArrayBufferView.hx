package lime.utils;


import haxe.io.Bytes;
import haxe.io.Error;

@:allow(lime.utils)


class ArrayBufferView {
	
	
	public var buffer:ArrayBuffer;
	public var byteOffset:Int;
	public var byteLength:Int;
	
	
	private function new (size:Int = 0) {
		
		if (size > 0) {
			
			buffer = new ArrayBuffer (size);
			byteOffset = 0;
			byteLength = size;
			
		}
		
	}
	
	
	public static function fromBytes (bytes:Bytes, pos:Int = 0, ?length:Int):ArrayBufferView {
		
		if (length == null) length = bytes.length - pos;
		if (pos < 0 || length < 0 || pos + length > bytes.length) throw Error.OutsideBounds;
		
		var view = new ArrayBufferView ();
		view.buffer = ByteArray.fromBytes (bytes);
		view.byteOffset = pos;
		view.byteLength = length;
		
		return view;
		
	}
	
	
	public function subarray (?begin:Int, ?end:Int):ArrayBufferView {
		
		if (begin == null) begin = 0;
		if (end == null) end = byteLength - begin;
		
		var view = new ArrayBufferView ();
		view.buffer = buffer;
		view.byteOffset = byteOffset + begin;
		view.byteLength = end;
		
		return view;
		
	}
	
	
}