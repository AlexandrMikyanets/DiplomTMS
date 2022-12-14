package diplom.shop.service;

import diplom.shop.model.component.*;
import diplom.shop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ComponentServiceImpl implements ComponentService {

    private final RamRepository ramRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ProcessorRepository processorRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final ComputerCaseRepository computerCaseRepository;

    @Autowired
    public ComponentServiceImpl(HddRepository hddRepository,
                                RamRepository ramRepository,
                                SsdRepository ssdRepository,
                                ProcessorRepository processorRepository,
                                PowerUnitRepository powerUnitRepository,
                                MotherBoardRepository motherBoardRepository,
                                GraphicsCardRepository graphicsCardRepository,
                                ComputerCaseRepository computerCaseRepository, ComponentRepository componentRepository) {
        this.processorRepository = processorRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.motherBoardRepository = motherBoardRepository;
        this.ramRepository = ramRepository;
        this.ssdRepository = ssdRepository;
        this.hddRepository = hddRepository;
        this.powerUnitRepository = powerUnitRepository;
        this.computerCaseRepository = computerCaseRepository;
    }

    @Transactional
    @Override
    public String getViewForComponents(String component, Model model) {
        switch (component) {
            case "rams": {
                Set<String> memory_types = ramRepository.findAll().stream().map(Ram::getType).collect(Collectors.toSet());
                Set<Integer> capacity = ramRepository.findAll().stream().map(Ram::getCapacity).collect(Collectors.toSet());
                Set<Integer> module_set = ramRepository.findAll().stream().map(Ram::getModuleSet).collect(Collectors.toSet());
                Set<String> producers = ramRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                model.addAttribute("rams", ramRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("module_set", module_set.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_types_set", memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "hdds": {
                Set<Integer> capacity = hddRepository.findAll().stream().map(Hdd::getCapacity).collect(Collectors.toSet());
                Set<Integer> buffer_size = hddRepository.findAll().stream().map(Hdd::getBufferSize).collect(Collectors.toSet());
                Set<String> form_factors = hddRepository.findAll().stream().map(Hdd::getFormFactor).collect(Collectors.toSet());
                Set<String> producers = hddRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> hdd_interface = hddRepository.findAll().stream().map(Hdd::getHddInterface).collect(Collectors.toSet());
                model.addAttribute("hdds", hddRepository.findAll());
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("buffer_size_set", buffer_size.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("hdd_interfaces_set", hdd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "ssds": {
                Set<Integer> capacity = ssdRepository.findAll().stream().map(Ssd::getCapacity).collect(Collectors.toSet());
                Set<String> form_factors = ssdRepository.findAll().stream().map(Ssd::getFormFactor).collect(Collectors.toSet());
                Set<String> producers = ssdRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> controllers = ssdRepository.findAll().stream().map(Ssd::getController).collect(Collectors.toSet());
                Set<String> microchips = ssdRepository.findAll().stream().map(Ssd::getMicrochipType).collect(Collectors.toSet());
                Set<String> ssd_interface = ssdRepository.findAll().stream().map(Ssd::getSsdInterface).collect(Collectors.toSet());
                model.addAttribute("ssds", ssdRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("controllers_set", controllers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("microchips_set", microchips.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("ssd_interfaces_set", ssd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "cases": {
                Set<String> types = computerCaseRepository.findAll().stream().map(ComputerCase::getCaseType).collect(Collectors.toSet());
                Set<String> colours = computerCaseRepository.findAll().stream().map(ComputerCase::getColour).collect(Collectors.toSet());
                Set<String> producers = computerCaseRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> material = computerCaseRepository.findAll().stream().map(ComputerCase::getMaterial).collect(Collectors.toSet());
                Set<Integer> sections = computerCaseRepository.findAll().stream().map(ComputerCase::getSectionNumber).collect(Collectors.toSet());
                model.addAttribute("cases", computerCaseRepository.findAll());
                model.addAttribute("types_set", types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("colours_set", colours.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("materials_set", material.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sections_set", sections.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "processors": {
                Set<String> cores = processorRepository.findAll().stream().map(Processor::getCore).collect(Collectors.toSet());
                Set<String> sockets = processorRepository.findAll().stream().map(Processor::getSocket).collect(Collectors.toSet());
                Set<String> producers = processorRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> crystal_name = processorRepository.findAll().stream().map(Processor::getCrystalName).collect(Collectors.toSet());
                Set<Integer> core_numbers = processorRepository.findAll().stream().map(Processor::getCoreNumber).collect(Collectors.toSet());
                model.addAttribute("processors", processorRepository.findAll());
                model.addAttribute("cores_set", cores.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("crystal_names_set", crystal_name.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("core_numbers_set", core_numbers.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "power_units": {
                Set<Double> power = powerUnitRepository.findAll().stream().map(PowerUnit::getPower).collect(Collectors.toSet());
                Set<String> producers = powerUnitRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> certificates = powerUnitRepository.findAll().stream().map(PowerUnit::getCertificate).collect(Collectors.toSet());
                Set<String> pfcs = powerUnitRepository.findAll().stream().map(PowerUnit::getPfc).collect(Collectors.toSet());
                Set<String> standards = powerUnitRepository.findAll().stream().map(PowerUnit::getStandard).collect(Collectors.toSet());
                model.addAttribute("power_units", powerUnitRepository.findAll());
                model.addAttribute("pfcs_set", pfcs.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("power_set", power.stream().sorted(Comparator.comparing(Double::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("standards_set", standards.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("certificates_set", certificates.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "mother_boards": {
                Set<Integer> m_twos = motherBoardRepository.findAll().stream().map(MotherBoard::getMTwo).collect(Collectors.toSet());
                Set<String> sockets = motherBoardRepository.findAll().stream().map(MotherBoard::getSocket).collect(Collectors.toSet());
                Set<String> pci_versions = motherBoardRepository.findAll().stream().map(MotherBoard::getPCIVersion).collect(Collectors.toSet());
                Set<String> chipsets = motherBoardRepository.findAll().stream().map(MotherBoard::getChipset).collect(Collectors.toSet());
                Set<String> producers = motherBoardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = motherBoardRepository.findAll().stream().map(MotherBoard::getFormFactor).collect(Collectors.toSet());
                Set<Integer> memory_slots = motherBoardRepository.findAll().stream().map(MotherBoard::getMemorySlots).collect(Collectors.toSet());
                Set<String> video_memory_types = motherBoardRepository.findAll().stream().map(MotherBoard::getMemoryType).collect(Collectors.toSet());
                model.addAttribute("mother_boards", motherBoardRepository.findAll());
                model.addAttribute("m_twos_set", m_twos.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("pci_versions_set", pci_versions.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("chipsets_set", chipsets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_slots_set", memory_slots.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "graphics_cards": {
                Set<String> producers = graphicsCardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> gpu_models = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuModel).collect(Collectors.toSet());
                Set<String> gpu_producers = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuProducer).collect(Collectors.toSet());
                Set<Integer> video_memories = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemory).collect(Collectors.toSet());
                Set<String> gpu_interfaces = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuInterface).collect(Collectors.toSet());
                Set<String> video_memory_types = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemoryType).collect(Collectors.toSet());
                model.addAttribute("graphics_cards", graphicsCardRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_models_set", gpu_models.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_producers_set", gpu_producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_interfaces_set", gpu_interfaces.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_set", video_memories.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            default: {
                return "redirect:/catalog";
            }
        }
        return "components/" + component;
    }

    @Transactional
    @Override
    public String getViewForComponentToAdd(String components, Model model) {
        String component = null;
        switch (components) {
            case "rams": {
                component = "ram";
                break;
            }
            case "hdds": {
                component = "hdd";
                break;
            }
            case "ssds": {
                component = "ssd";
                break;
            }
            case "cases": {
                component = "ccase";
                break;
            }
            case "processors": {
                component = "processor";
                break;
            }
            case "power_units": {
                component = "power_unit";
                break;
            }
            case "mother_boards": {
                component = "mother_board";
                break;
            }
            case "graphics_cards": {
                component = "graphics_card";
                break;
            }
            default: {
                return "redirect:/admin/content";
            }
        }
        return "components/component/new/" + component + "_new";
    }

    @Override
    public String getViewForComponentById(String component, Long id, Model model) {
        switch (component) {
            case "ram": {
                model.addAttribute("ram", ramRepository.findById(id).get());
                break;
            }
            case "hdd": {
                model.addAttribute("hdd", hddRepository.findById(id).get());
                break;
            }
            case "ssd": {
                model.addAttribute("ssd", ssdRepository.findById(id).get());
                break;
            }
            case "ccase": {
                model.addAttribute("ccase", computerCaseRepository.findById(id).get());
                break;
            }
            case "processor": {
                model.addAttribute("processor", processorRepository.findById(id).get());
                break;
            }
            case "power_unit": {
                model.addAttribute("power_unit", powerUnitRepository.findById(id).get());
                break;
            }
            case "mother_board": {
                model.addAttribute("mother_board", motherBoardRepository.findById(id).get());
                break;
            }
            case "graphics_card": {
                model.addAttribute("graphics_card", graphicsCardRepository.findById(id).get());
                break;
            }
            default: {
                return "redirect:/catalog";
            }
        }
        return "components/component/" + component;
    }

    @Override
    public String getViewForComponentToEdit(String component, long id, Model model) {
        switch (component) {
            case "ram": {
                model.addAttribute("ram", ramRepository.getById(id));
                break;
            }
            case "hdd": {
                model.addAttribute("hdd", hddRepository.getById(id));
                break;
            }
            case "ssd": {
                model.addAttribute("ssd", ssdRepository.getById(id));
                break;
            }
            case "ccase": {
                model.addAttribute("ccase", computerCaseRepository.getById(id));
                break;
            }
            case "processor": {
                model.addAttribute("processor", processorRepository.getById(id));
                break;
            }
            case "power_unit": {
                model.addAttribute("power_unit", powerUnitRepository.getById(id));
                break;
            }
            case "mother_board": {
                model.addAttribute("mother_board", motherBoardRepository.getById(id));
                break;
            }
            case "graphics_card": {
                model.addAttribute("graphics_card", graphicsCardRepository.getById(id));
                break;
            }
            default: {
                return "redirect:/admin/content";
            }
        }
        return "components/component/edit/" + component + "_edit";
    }

}
