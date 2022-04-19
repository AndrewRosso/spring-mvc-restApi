package ru.andrewrosso.springmvcrest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.andrewrosso.springmvcrest.dao.Course;
import ru.andrewrosso.springmvcrest.dao.CourseService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/courses")
public class CourseController {

    private CourseService courseService;

    @Autowired
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model){
        List<Course> courses = courseService.findAll();
        model.addAttribute("courses",courses);
        return "courses/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id, Model model) {
        courseService.delete(id);
        return "redirect:/courses";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") int id, Model model){
        model.addAttribute("course", courseService.findById(id));
        return "courses/updateForm";
    }

    @RequestMapping(value = "/update/0", method = RequestMethod.GET)
    public String newForm(Model model){
        return "courses/updateForm";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String update(@ModelAttribute("course") @Valid Course course,
                         BindingResult bindingResult) {

        if (bindingResult.hasErrors()){
            return "courses/updateForm";
        }
        courseService.save(course);
        return "redirect:/courses";
    }
}
