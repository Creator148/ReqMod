package com.boots.controller;

import javax.validation.Valid;

import com.boots.entity.Todo;
import com.boots.service.ITodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TodoController {

    @Autowired
    private ITodoService todoService;

    @RequestMapping(value = "/list-todo", method = RequestMethod.GET)
    public String showTodos(ModelMap model) {
        String name = getLoggedInUserName(model);
        model.put("listTodo", todoService.getTodosByUser(name));
        // model.put("todos", service.retrieveTodos(name));
        return "list-todo";
    }

    private String getLoggedInUserName(ModelMap model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        return principal.toString();
    }

    @RequestMapping(value = "/add-todo", method = RequestMethod.GET)
    public String showAddTodoPage(ModelMap model) {
        model.addAttribute("todo", new Todo());
        return "add-todo";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteTodo(@RequestParam long id) {
        todoService.deleteTodo(id);
        // service.deleteTodo(id);
        return "redirect:/list-todo";
    }

    @RequestMapping(value = "/update-todo", method = RequestMethod.GET)
    public String showUpdateTodoPage(@RequestParam long id, ModelMap model) {
        Todo todo = todoService.getTodoById(id).get();
        model.put("todo", todo);
        return "update-todo";
    }

    @RequestMapping(value = "/update-todo/{id}", method = RequestMethod.POST)
    public String updateTodo(@RequestParam("isDone") String isDone,@PathVariable("id") String id,ModelMap model, @Valid Todo todo, BindingResult result) {

        if (result.hasErrors()) {
            return "todo";
        }
        todo.setIs_done(Boolean.parseBoolean(isDone));
        todo.setUserName(getLoggedInUserName(model));
        todoService.updateTodo(todo);
        return "redirect:/list-todo";
    }

    @RequestMapping(value = "/add-todo", method = RequestMethod.POST)
    public String addTodo(@RequestParam("isDone") String isDone,ModelMap model, @Valid Todo todo, BindingResult result) {

//        if (result.hasErrors()) {
//            return "index";
//        }
        todo.setIs_done(Boolean.parseBoolean(isDone));
        todo.setUserName(getLoggedInUserName(model));

        todoService.saveTodo(todo);
        return "redirect:/list-todo";
    }
}
