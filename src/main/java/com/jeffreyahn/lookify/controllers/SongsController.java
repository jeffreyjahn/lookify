package com.jeffreyahn.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeffreyahn.lookify.models.Song;
import com.jeffreyahn.lookify.services.SongService;

@Controller
public class SongsController {
	private final SongService songService;
	public SongsController(SongService songService) {
		this.songService = songService;
	}
	@RequestMapping("/")
	public String index() {
		return "/lookify/index.jsp";
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "/lookify/dashboard.jsp";
	}
	@RequestMapping("/songs/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "/lookify/show.jsp";
	}
	@RequestMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song song) {
		return "/lookify/new.jsp";
	}
	@RequestMapping(value="/songs/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "/lookify/new.jsp";
		} else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
	@RequestMapping(value="/songs/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
	@RequestMapping("/search")
	public String searchRedirect(@RequestParam(value="search") String search) {
		return "redirect:/search/"+search;
	}
	@RequestMapping("/search/{text}")
	public String search(Model model, @PathVariable(value="text") String text) {
		if(text.equals("topTen")) {
			List<Song> topTen = songService.findTopTen();
			model.addAttribute("top", topTen);
			return "/lookify/topten.jsp";
		} else {
			List<Song> search = songService.findByArtist(text);
			model.addAttribute("search", search);
			model.addAttribute("artist", text);
			return "/lookify/search.jsp";
		}
	}
}
