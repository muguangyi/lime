package lime.utils;


import haxe.io.Bytes;
import haxe.io.Error;

@:forward(buffer, byteLength, byteOffset)


abstract DataView(ArrayBufferView) from ArrayBufferView to ArrayBufferView from UInt8Array to UInt8Array {
	
	
	public var name (get, never):String;
	
	
	public inline function new (elements:Int) {
		
		this = new ArrayBufferView (elements);
		
	}
	
	
	public inline function getFloat32 (byteOffset:Int):Float {
		
		return this.buffer.getFloat (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getFloat64 (byteOffset:Int):Float {
		
		return this.buffer.getFloat (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getInt16 (byteOffset:Int):Int {
		
		return this.buffer.getUInt16 (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getInt32 (byteOffset:Int):Int {
		
		return this.buffer.getInt32 (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getInt8 (byteOffset:Int):Int {
		
		return this.buffer.get (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getUInt16 (byteOffset:Int):Int {
		
		return this.buffer.getUInt16 (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getUInt32 (byteOffset:Int):UInt {
		
		return this.buffer.getInt32 (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function getUInt8 (byteOffset:Int):Int {
		
		return this.buffer.get (byteOffset + this.byteOffset);
		
	}
	
	
	public inline function setFloat32 (byteOffset:Int, value:Float):Void {
		
		return this.buffer.setFloat (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setFloat64 (byteOffset:Int, value:Float):Void {
		
		return this.buffer.setFloat (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setInt16 (byteOffset:Int, value:Int):Void {
		
		return this.buffer.setUInt16 (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setInt32 (byteOffset:Int, value:Int):Void {
		
		return this.buffer.setInt32 (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setInt8 (byteOffset:Int, value:Int):Void {
		
		return this.buffer.set (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setUInt16 (byteOffset:Int, value:Int):Void {
		
		return this.buffer.setUInt16 (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setUInt32 (byteOffset:Int, value:UInt):Void {
		
		return this.buffer.setInt32 (byteOffset + this.byteOffset, value);
		
	}
	
	
	public inline function setUInt8 (byteOffset:Int, value:Int):Void {
		
		return this.buffer.set (byteOffset + this.byteOffset, value);
		
	}
	
	
	@:noCompletion @:arrayAccess public inline function __get (index:Int):Float {
		
		return this.buffer.get (index + this.byteOffset);
		
	}
	
	
	@:noCompletion @:arrayAccess public inline function __set (index:Int, value:Int):Int {
		
		if (index >= 0 && index < this.byteLength) {
			
			this.buffer.set (index + this.byteOffset, value);
			return value;
			
		}
		
		return 0;
		
	}
	
	
	
	
	// Get & Set Methods
	
	
	
	
	private inline function get_name ():String {
		
		return "DataView";
		
	}
	
	
}