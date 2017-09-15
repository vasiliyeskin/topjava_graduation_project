package ru.javarest_api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import ru.javarest_api.model.User;
import ru.javarest_api.repository.UserRepository;
import ru.javarest_api.util.exception.NotFoundException;

import java.util.List;

import static ru.javarest_api.util.ValidationUtil.checkNotFoundWithId;

@Service
public class UserService {

    private final UserRepository repository;

    @Autowired
    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public User get(int id) throws NotFoundException {
        return checkNotFoundWithId(repository.get(id), id);
    }

    @Cacheable("users")
    public List<User> getAll() {
        return repository.getAll();
    }
}
