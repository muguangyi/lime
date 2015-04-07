package lime.utils;


import haxe.io.Bytes;
import haxe.io.Error;

@:forward(buffer, byteLength, byteOffset)


abstract UInt8Array(ArrayBufferView) from ArrayBufferView to ArrayBufferView {
	
	
	public static inline var BYTES_PER_ELEMENT = 1;
	
	public var length (get, never):Int;
	public var name (get, never):String;
	
	
	public function new #if !java <T> #end (bufferOrArray:#if !java T #else Dynamic #end, start:Int = 0, length:Null<Int> = null) {
		
		#if (openfl && neko && !lime_legacy)
		if (Std.is (bufferOrArray, openfl.Vector.VectorData)) {
			
			var vector:openfl.Vector<Int> = cast bufferOrArray;
			var ints:Array<Int> = vector;
			
			this = fromArray (ints);
			
		} else
		#end
		
		if (Std.is (bufferOrArray, Int)) {
			
			var elements:Int = cast bufferOrArray;
			this = new ArrayBufferView (elements * BYTES_PER_ELEMENT);
			
		} else if (Std.is (bufferOrArray, Array)) {
			
			var ints:Array<Int> = cast bufferOrArray;
			this = fromArray (ints);
			
		} else {
			
			this = cast bufferOrArray;
			
		}
		
	}
	
	
	//public inline function new (elements:Int) {
		//
		//this = new ArrayBufferView (elements * BYTES_PER_ELEMENT);
		//
	//}
	
	
	public inline function set (typedArray:ArrayBufferView, offset:Int = 0):Void {
		
		this.buffer.blit (offset, typedArray.buffer, 0, typedArray.byteLength);
		
	}
	
	
	public inline function subarray (?begin:Int, ?end:Int):UInt8Array {
		
		return this.subarray (begin, end);
		
	}
	
	
	public static function fromArray (a:Array<Int>, pos = 0, ?length:Int):UInt8Array {
		
		if (length == null) length = a.length - pos;
		if (pos < 0 || length < 0 || pos + length > a.length) throw Error.OutsideBounds;
		
		var i = new UInt8Array (a.length);
		
		for (idx in 0...length)
			i[idx] = a[idx + pos];
		
		return i;
		
	}
	
	
	public static function fromBytes (bytes:Bytes, bytePos:Int = 0, ?length:Int):UInt8Array {
		
		return ArrayBufferView.fromBytes (bytes, bytePos, length);
		
	}
	
	
	@:noCompletion @:arrayAccess public inline function __get (index:Int):Int {
		
		return this.buffer.get (index + this.byteOffset);
		
	}
	
	
	@:noCompletion @:arrayAccess public inline function __set (index:Int, value:Int):Int {
		
		if (index >= 0 && index < length ) {
			
			this.buffer.set (index + this.byteOffset, value);
			return value;
			
		}
		
		return 0;
		
	}
	
	
	
	
	// Get & Set Methods
	
	
	
	
	private inline function get_length ():Int {
		
		return this.byteLength;
		
	}
	
	
	private inline function get_name ():String {
		
		return "UInt8Array";
		
	}
	
	
}