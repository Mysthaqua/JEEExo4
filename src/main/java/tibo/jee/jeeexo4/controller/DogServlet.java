package tibo.jee.jeeexo4.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tibo.jee.jeeexo4.entity.Dog;
import tibo.jee.jeeexo4.repository.Repository;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/dogs/*")
public class DogServlet extends HttpServlet {
    private Repository<Dog> dogRepo;

    @Override
    public void init() {
        dogRepo = new Repository<>(Dog.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo() == null ? "" : req.getPathInfo();
        switch (path) {
            case "" -> {
                try {
                    Integer.parseInt(req.getParameter("id"));
                    detail(req, resp);
                } catch (NumberFormatException e) {
                    list(req, resp);
                }
            }
            case "/add" -> add(req, resp);
            case "/edit" -> edit(req, resp);
            default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "create" -> create(req, resp);
            case "update" -> update(req, resp);
            case "delete" -> delete(req, resp);
            default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/dogs/add.jsp").forward(req, resp);
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogRepo.get(id);

        if (dog == null) {
            list(req, resp);
            return;
        }

        req.setAttribute("dog", dog);
        req.getRequestDispatcher("/WEB-INF/dogs/edit.jsp").forward(req, resp);
    }

    private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Dog> dogs = dogRepo.getAll();
        req.setAttribute("dogs", dogs);
        req.getRequestDispatcher("/WEB-INF/dogs/list.jsp").forward(req, resp);
    }

    private void detail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogRepo.get(id);

        if (dog == null) {
            list(req, resp);
            return;
        }

        req.setAttribute("dog", dog);
        req.getRequestDispatcher("/WEB-INF/dogs/detail.jsp").forward(req, resp);
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));

        dogRepo.merge(
                Dog.builder()
                        .name(name)
                        .breed(breed)
                        .birthDate(birthDate)
                        .build()
        );

        list(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogRepo.get(id);

        if (dog != null) {
            String name = req.getParameter("name");
            String breed = req.getParameter("breed");
            LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));

            dog.setName(name);
            dog.setBreed(breed);
            dog.setBirthDate(birthDate);

            dogRepo.merge(dog);
        }

        list(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogRepo.get(id);

        if (dog != null) {
            dogRepo.remove(dog);
        }

        list(req, resp);
    }
}
