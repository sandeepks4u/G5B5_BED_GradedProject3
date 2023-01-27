package com.gl.tta.services;

import java.util.List;

import com.gl.tta.entity.Ticket;

public interface TicketService {
	public List<Ticket> findAll();

	public Ticket findById(int theId);

	public void save(Ticket theticket);

	public void deleteById(int theId);

	public List<Ticket> searchBy(String title, String description);

}
