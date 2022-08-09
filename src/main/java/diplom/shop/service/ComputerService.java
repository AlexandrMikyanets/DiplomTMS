package diplom.shop.service;

import diplom.shop.model.Computer;

public interface ComputerService {

    Computer addComponentById(long id, String component, long componentId);

    boolean checkByIdIfNotEmpty(long id);

    void deleteComponentFromComputer(long id, String component);
}
