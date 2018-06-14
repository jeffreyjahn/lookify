package com.jeffreyahn.lookify.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="songs")
public class Song {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Length(min=5, message="Length must exceeed 5 characters.")
	private String title;
	@Length(min=5, message="Length must exceed 5 characters.")
	private String artist;
	@Min(value=1, message="Rating must be more than 0.")
	@Max(value=10, message="Rating max is 10.")
	private Integer rating;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	public Song() {
	}
	public Song(String title, String artist, Integer rating) {
		this.title=title;
		this.artist=artist;
		this.rating=rating;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	private void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	@PrePersist
    protected void onCreate(){
        this.setCreatedAt(new Date());
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
