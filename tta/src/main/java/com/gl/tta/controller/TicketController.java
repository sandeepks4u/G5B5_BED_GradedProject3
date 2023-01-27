package com.gl.tta.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.tta.entity.Ticket;
import com.gl.tta.services.TicketService;

@Controller
@RequestMapping("/tickets")
public class TicketController {
	@Autowired
	private TicketService ticketService;

	@RequestMapping("/list")
	public String listBooks(Model theModel) {
		List<Ticket> theTickets = ticketService.findAll();
		theModel.addAttribute("Tickets", theTickets);
		return "listTickets";

	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {

		// create model attribute to bind form data
		Ticket theTicket = new Ticket();

		theModel.addAttribute("Ticket", theTicket);

		return "Ticketform";
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("TicketId") int theId, Model theModel) {

		// get the Book from the service
		Ticket theTicket = ticketService.findById(theId);

		// set Book as a model attribute to pre-populate the form
		theModel.addAttribute("Ticket", theTicket);

		// send over to our form
		return "Ticketform";
	}

	@PostMapping("/save")
	public String saveBook(@RequestParam("id") int id, @RequestParam("title") String title,
			@RequestParam("description") String description, @RequestParam("date") Date date) {

		System.out.println(id);
		Ticket theTicket;
		if (id != 0) {
			theTicket = ticketService.findById(id);
			theTicket.setTitle(title);
			theTicket.setDescription(description);
			theTicket.setDate(date);
		} else
			theTicket = new Ticket(id, title, description, date);
		// save the ticket
		ticketService.save(theTicket);

		// use a redirect to prevent duplicate submissions
		return "redirect:/tickets/list";

	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("TicketId") int theId) {

		// delete the Ticket
		ticketService.deleteById(theId);

		// redirect to /Ticket/list
		return "redirect:/tickets/list";

	}

	@RequestMapping("/search")
	public String search(@RequestParam("title") String title,
			@RequestParam("description") String description,
			Model theModel) {

		// check names, if both are empty then just give list of all Tickets

		if (title.trim().isEmpty() && description.trim().isEmpty()) {
			return "redirect:/tickets/list";
		}
		else {
			// else, search by first name and last name
			List<Ticket> theTickets =
					ticketService.searchBy(title, description);

			// add to the spring model
			theModel.addAttribute("Tickets", theTickets);

			// send to list-Tickets
			return "listTickets";
		}
	}
}
