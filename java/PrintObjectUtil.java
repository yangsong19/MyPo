package com.ys.util;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class PrintObjectUtil {

	@SuppressWarnings({ "rawtypes" })
	public static String print(Object obj) throws Exception {
		StringBuffer outerInfo = new StringBuffer();
		String fieldName = null;
		Object fieldVal = null;
		Class clazz = obj.getClass();

		if(clazz != null) {
			Field[] fields = clazz.getDeclaredFields();
			if(fields != null && fields.length != 0) {
				outerInfo.append("[");
				for(Field field:fields) {
					field.setAccessible(true);
					fieldName = field.getName(); 
					fieldVal = field.get(obj);

					outerInfo.append(printInnerInfo(fieldVal, fieldName).toString());
					
				}
			}
			if(outerInfo.length() > 0 && outerInfo.charAt(outerInfo.length()-1) == ',') {
				outerInfo.deleteCharAt(outerInfo.length() - 1);
				outerInfo.append("]");
			}
		} 
		return outerInfo.toString();
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static StringBuffer printInnerInfo(Object obj,Object fieldName) throws Exception {
//		clazz.isPrimitive();
		StringBuffer innerInfo = new StringBuffer();
		if(obj == null) {
			innerInfo.append(fieldName + ":" + "Null,");
			return innerInfo;
		}
		
		Class clazz = obj.getClass();
		Method method;
		Object val;
		if(obj instanceof String || obj instanceof Number || obj instanceof Boolean || obj instanceof Character) {
			innerInfo.append(fieldName + ":" + obj + ",");
		} else {
			innerInfo.append(fieldName + ":");
			if(isSystemClass(clazz)) {
				System.out.println("===="+clazz.getName());
				if(obj instanceof List) {
					method = clazz.getDeclaredMethod("size", new Class[]{});
					val = method.invoke(obj, new Object[]{});
					int size = (Integer)val;
					if(0 == size) {
						innerInfo.append("{Empty,");
					} else {
						method = clazz.getDeclaredMethod("get", Integer.TYPE);
						
						innerInfo.append("{");
						for(int i = 0;i < size;i ++) {
							Object value = method.invoke(obj, i);
							if(isSystemClass(value.getClass())) {
								innerInfo.append(printInnerInfo(value, value.getClass()));
							} else {
								innerInfo.append(value.getClass().getName() + ":" + print(value) +",");
							}
						}
					}
					if(innerInfo.length() > 0)
						innerInfo.deleteCharAt(innerInfo.length() - 1);
					innerInfo.append("},");
				} else if(obj instanceof Map) {
					Method methodIsEmpty = clazz.getMethod("isEmpty", new Class[]{});
					boolean isEmpty = (Boolean) methodIsEmpty.invoke(obj, new Object[]{});
					if(isEmpty){
						innerInfo.append("{Empty,");
					} else {
						Method methodKeySet = clazz.getMethod("keySet", new Class[]{});
						Object valKeySet = methodKeySet.invoke(obj, new Object[]{});//keySet
						
						Method methodIterator = valKeySet.getClass().getMethod("iterator", new Class[]{});
						methodIterator.setAccessible(true);
						Object valIterator = methodIterator.invoke(valKeySet, new Object[]{});//iterator
						
						Method hasNext = valIterator.getClass().getMethod("hasNext", new Class[]{});
						hasNext.setAccessible(true);
						Method next = valIterator.getClass().getMethod("next", new Class[]{});
						next.setAccessible(true);
						
						Method getMethod = clazz.getMethod("get", new Object().getClass());
						
						innerInfo.append("{");
						while((Boolean) hasNext.invoke(valIterator, new Object[]{})) {
							Object key = next.invoke(valIterator, new Object[]{});
							Object value = getMethod.invoke(obj, key);
							if(isSystemClass(value.getClass())) {
								innerInfo.append(printInnerInfo(value, value.getClass()));
							} else {
								innerInfo.append("key[" + key + "]-value[" + print(value) +"],");
							}
						}
					}
					
					if(innerInfo.length() > 0)
						innerInfo.deleteCharAt(innerInfo.length() - 1);
					innerInfo.append("},");
				} else if(obj instanceof Set) {
					Method methodIsEmpty = clazz.getMethod("isEmpty", new Class[]{});
					boolean isEmpty = (Boolean) methodIsEmpty.invoke(obj, new Object[]{});
					if(isEmpty){
						innerInfo.append("{Empty,");
					} else {
						Method methodIterator = clazz.getMethod("iterator", new Class[]{});
						Object valIterator = methodIterator.invoke(obj, new Object[]{});
						
						Method hasNext = valIterator.getClass().getMethod("hasNext", new Class[]{});
						hasNext.setAccessible(true);
						Method next = valIterator.getClass().getMethod("next", new Class[]{});
						next.setAccessible(true);
						
						innerInfo.append("{");
						while((Boolean) hasNext.invoke(valIterator, new Object[]{})) {
							Object value = next.invoke(valIterator, new Object[]{});
							if(isSystemClass(value.getClass()))
								innerInfo.append(printInnerInfo(value, value.getClass()));
							else 
								innerInfo.append(value.getClass().getName() + ":" + print(value) + ",");
						}
					}
					
					if(innerInfo.length() > 0)
						innerInfo.deleteCharAt(innerInfo.length() - 1);
					innerInfo.append("},");
				} else if(clazz.isArray()){
					innerInfo.append("[");
					int len = Array.getLength(obj);
					if(0 == len) {
						innerInfo.append("Empty,");
					} else {
						for(int i = 0;i < len;i ++) {
							Object value = Array.get(obj, i);
							if(isSystemClass(value.getClass())) {
								innerInfo.append(printInnerInfo(value, value.getClass()));
							} else {
								innerInfo.append(value.getClass().getName() + ":" + print(value) + ",");
							}
						}
					}
					if(innerInfo.length() > 0)
						innerInfo.deleteCharAt(innerInfo.length() - 1);
					innerInfo.append("],");
				} else {
					// other situation, if need, can added by yourself
					innerInfo.append(clazz.getName() + ",");
				}
			} else {
				if(!obj.toString().startsWith(clazz.getName() + "@")) {
					innerInfo.append(obj.toString() + ",");// not system class, but override the toString method,return;
					System.out.println("=======");
				} else {
					if(clazz.isArray()){
						innerInfo.append("[");
						int len = Array.getLength(obj);
						if(0 == len) {
							innerInfo.append("Empty,");
						} else {
							for(int i = 0;i < len;i ++) {
								Object value = Array.get(obj, i);
								if(isSystemClass(value.getClass())) {
									innerInfo.append(printInnerInfo(value, value.getClass()));
								} else {
									innerInfo.append(value.getClass().getName() + ":" + print(value) + ",");
								}
							}
						}
						if(innerInfo.length() > 0)
							innerInfo.deleteCharAt(innerInfo.length() - 1);
						innerInfo.append("],");
					} else {
						return innerInfo.append(clazz.getName() + ":" + print(obj) + ",");
					}
				}
			}
		}
		
		return innerInfo;
	}
	
	public static boolean isWrapperClass(Class clazz) {
		try {
			return ((Class) clazz.getField("TYPE").get(null)).isPrimitive();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}  
	}
	
	public static boolean isSystemClass(Class<?> clz) {
		return clz != null && clz.getClassLoader() == null;
	} 
	
	public static void printMsg() throws Exception {
		Content content1 = new Content("content url11","content title1","keywords1","thumbnail1", 100);
		Item item1 = new Item("clip title1","www.baidu.com","description1",content1);
		
		Content content2 = new Content("content url22","content title22","keywords22","thumbnail22", 50);
		Item item2 = new Item("clip title22","www.tencent.com","description22",content2);
		
		Set<Item> set = new HashSet<Item>();
		set.add(item1);
		set.add(item2);
		
		Channel channel = new Channel("channel title", "channel description", 1, set);
		
		System.out.println(PrintObjectUtil.print(content1));
		System.out.println(PrintObjectUtil.print(item1));
		System.out.println(PrintObjectUtil.print(channel));
		
		ArrayList<String> list0 = new ArrayList<String>();
		ArrayList<Integer> list1 = new ArrayList<Integer>();
		System.out.println(list0.getClass() == list1.getClass()); // true 可见  JVM 只会在编译时去检查泛型，在运行时是不带泛型的，即去泛型的
		
		List<String> list3 = new LinkedList<String>();
		System.out.println(list3.getClass() == list1.getClass()); // false
		
		
		Set<String> set0 = new HashSet<String>();
		Set<Integer> set1 = new LinkedHashSet<Integer>();
		System.out.println(set0.getClass() == set1.getClass()); // false
		
		System.out.println(int.class.isPrimitive()); // true
		System.out.println(int.class == Integer.TYPE); // true
		System.out.println(Void.TYPE == void.class); // true
		
	}

	public static void printMsg2() throws Exception {
		System.out.println(int.class.getClassLoader());    // null
		System.out.println(Integer.class.getClassLoader());// null
		System.out.println(int.class == Integer.class);    // false
		System.out.println(int.class == Integer.TYPE);	   // true
		System.out.println(int.class.getClass() == Integer.class.getClass());  // true

		System.out.println("============isWrapperClass==============");
//		System.out.println(isWrapperClass(Content.class)); // false, is the class user defined.
		System.out.println(isWrapperClass(Byte.class));
		System.out.println(isWrapperClass(Character.class));
		System.out.println(isWrapperClass(Integer.class));
		System.out.println(isWrapperClass(Short.class));
		System.out.println(isWrapperClass(Long.class));
		System.out.println(isWrapperClass(Float.class));
		System.out.println(isWrapperClass(Double.class));
		System.out.println(isWrapperClass(Boolean.class));
		System.out.println(isWrapperClass(Void.class));

		
		System.out.println("^^^^^^^^^^^^^isJavaClass^^^^^^^^^^^^^");
		System.out.println(isSystemClass(Content.class)); // false, is the class user defined.
		System.out.println(isSystemClass(byte.class));    // true
		System.out.println(isSystemClass(char.class)); 	// true
		System.out.println(isSystemClass(int.class)); 	// true
		System.out.println(isSystemClass(short.class)); 	// true
		System.out.println(isSystemClass(long.class)); 	// true
		System.out.println(isSystemClass(float.class));	// true
		System.out.println(isSystemClass(double.class));	// true
		System.out.println(isSystemClass(boolean.class));	// true
		System.out.println(isSystemClass(void.class)); 	// true
		
		
		System.out.println(isSystemClass(Byte.class));
		System.out.println(isSystemClass(Character.class));
		System.out.println(isSystemClass(Integer.class));
		System.out.println(isSystemClass(Short.class));
		System.out.println(isSystemClass(Long.class));
		System.out.println(isSystemClass(Float.class));
		System.out.println(isSystemClass(Double.class));
		System.out.println(isSystemClass(Boolean.class));
		System.out.println(isSystemClass(Void.class));
		
		System.out.println(isSystemClass(List.class));
		System.out.println(isSystemClass(LinkedList.class));
		System.out.println(isSystemClass(Enum.class));
	}
	
}
