package diplom.shop.controller;

import diplom.shop.enumm.ExceptionMessage;
import diplom.shop.model.Review;
import diplom.shop.model.User;
import diplom.shop.repository.*;
import diplom.shop.service.ComponentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CatalogController {

    private final ComponentRepository componentRepository;
    private final ProcessorRepository processorRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final RamRepository ramRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ComputerCaseRepository computerCaseRepository;
    private final ComponentServiceImpl componentService;
    private final ReviewRepository reviewRepository;

    @Autowired
    public CatalogController(ComponentRepository componentRepository, ProcessorRepository processorRepository,
                             GraphicsCardRepository graphicsCardRepository,
                             MotherBoardRepository motherBoardRepository,
                             RamRepository ramRepository,
                             SsdRepository ssdRepository,
                             HddRepository hddRepository,
                             PowerUnitRepository powerUnitRepository,
                             ComputerCaseRepository computerCaseRepository,
                             ComponentServiceImpl componentService, ReviewRepository reviewRepository) {
        this.componentRepository = componentRepository;
        this.processorRepository = processorRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.motherBoardRepository = motherBoardRepository;
        this.ramRepository = ramRepository;
        this.ssdRepository = ssdRepository;
        this.hddRepository = hddRepository;
        this.powerUnitRepository = powerUnitRepository;
        this.computerCaseRepository = computerCaseRepository;
        this.componentService = componentService;
        this.reviewRepository = reviewRepository;
    }

    @GetMapping("/catalog")
    public String catalog(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", user);
        return "catalog";
    }

    @GetMapping("/catalog/{component}")
    public String componentsList(@PathVariable String component, Model model) {
        return componentService.getViewForComponents(component, model);
    }

    @GetMapping("/catalog/{component}/{id}")
    public String componentInfo(@PathVariable String component, @PathVariable Long id, Model model) {
        return componentService.getViewForComponentById(component, id, model);
    }

    @PostMapping("/catalog/{component}/{id}/comment")
    public String saveComment(@PathVariable String component, @PathVariable Long id, String message, Model model, @AuthenticationPrincipal User user) {
        if (message.isEmpty()) {
            model.addAttribute("error", ExceptionMessage.MESSAGE_IS_EMPTY.toString());
            return componentService.getViewForComponentById(component, id, model);
        }

        Review review = new Review();
        review.setText(message);
        review.setComponent(componentRepository.findById(id).get());
        review.setUser(user);

        reviewRepository.save(review);

        return "redirect:/catalog/" + component + "/" + id;
    }

    @PostMapping("/catalog/{component}/{id}/comment/{commentId}")
    public String deleteComment(@PathVariable String component, @PathVariable Long id, @PathVariable Long commentId, Model model) {
        reviewRepository.deleteById(commentId);
        return "redirect:/catalog/" + component + "/" + id;
    }
}
