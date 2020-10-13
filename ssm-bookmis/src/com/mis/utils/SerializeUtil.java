package com.mis.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializeUtil {

	/**
	 * 实体类对象的序列化
	 * 就是把对象转化为byte数组
	 * @param object 要序列化的对象
	 * @return
	 */
	public static byte[] serialize(Object object) {
		byte[] bytes = null;
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();//byte数组输出流对象
			ObjectOutputStream oos = new ObjectOutputStream(baos);//对象输出流的对象(参数是输出流对象，这里指明为byte数组输出流)
			oos.writeObject(object);//把对象写入到对象输出流
			bytes = baos.toByteArray();//把对象转化为byte数组
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bytes;
	}
	
	/**
	 * 反序列化
	 * 就是把对象序列化成的byte数组反序列化成普通的对象
	 * @param bytes 对象被序列化成的byte数组
	 * @return
	 */
	public static Object unserialize(byte[] bytes) {
		Object object = null;
		try {
			ByteArrayInputStream bais = new ByteArrayInputStream(bytes);//byte数组输入流对象
			ObjectInputStream ois = new ObjectInputStream(bais);//对象输入流的对象
			object = ois.readObject();//从对象输入流中把传入的byte数组读取成普通对象
		}catch(Exception e) {
			e.printStackTrace();
		}
		return object;
	}
}
