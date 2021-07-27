package com.dp.ggomjirak.vo;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class UrlOGTag {
	private String url;
	private String title;
	private String image;
	private String desc;
	
	
	public UrlOGTag() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UrlOGTag(String url) {
	  try {
	        Connection con = Jsoup.connect(url);
	        Document doc = con.get();
	        Elements ogTags = doc.select("meta[property^=og:]");
	        if (ogTags.size() <= 0) {
	        	System.out.println("ogTag못찾음");
	        }
	        for (int i = 0; i < ogTags.size(); i++) {
	            Element tag = ogTags.get(i);
	            String text = tag.attr("property");
	            if ("og:url".equals(text)) {
	            	this.url = tag.attr("content");
	            } else if ("og:image".equals(text)) {
	            	this.image = tag.attr("content");
	            } else if ("og:description".equals(text)) {
	            	this.desc = tag.attr("content");
	            } else if ("og:title".equals(text)) {
	            	this.title = tag.attr("content");
	            }
	        }
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
	}

	public UrlOGTag(String url, String title, String image, String desc) {
		super();
		this.url = url;
		this.title = title;
		this.image = image;
		this.desc = desc;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getDesc() {
		return desc;
	}


	public void setDesc(String desc) {
		this.desc = desc;
	}


	@Override
	public String toString() {
		return "UrlOGTag [url=" + url + ", title=" + title + ", image=" + image + ", desc=" + desc + "]";
	}
	

	
	
	
	
}
