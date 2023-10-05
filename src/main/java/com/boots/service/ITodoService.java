package com.boots.service;

import com.boots.entity.Todo;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface ITodoService {
    List<Todo> getTodosByUser(String user);

    Optional< Todo > getTodoById(long id);

    void updateTodo(Todo todo);

    void addTodo(String name, String desc, LocalDateTime targetDate, boolean isDone);

    void deleteTodo(long id);

    void saveTodo(Todo todo);
}
