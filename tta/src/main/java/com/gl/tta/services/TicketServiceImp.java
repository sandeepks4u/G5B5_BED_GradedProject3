package com.gl.tta.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.tta.entity.Ticket;
import com.gl.tta.repository.TicketRepository;
@Service
public class TicketServiceImp implements TicketService {
	@Autowired
	TicketRepository ticketRepository;

	@Override
	public List<Ticket> findAll() {
		List<Ticket> tickets=ticketRepository.findAll();
		return tickets;
	}

	@Override
	public Ticket findById(int theId) {
		
		return ticketRepository.findById(theId).get();
	}

	@Override
	public void save(Ticket theticket) {
		ticketRepository.save(theticket);
		
	}

	@Override
	public void deleteById(int theId) {
		ticketRepository.deleteById(theId);
		
	}

	@Override
	public List<Ticket> searchBy(String title, String description) {
		List<Ticket> tickets=ticketRepository.findByTitleContainsAndDescriptionContainsAllIgnoreCase(title, description);
		return tickets;
	}

}
