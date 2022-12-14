package diplom.shop.model.component;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "processor")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Processor extends Component {

    @Column(name = "core", nullable = false)
    private String core;

    @Column(name = "socket", nullable = false)
    private String socket;

    @Column(name = "min_freq", nullable = false)
    private double minFreq;

    @Column(name = "max_freq", nullable = false)
    private double maxFreq;

    @Column(name = "core_number", nullable = false)
    private int coreNumber;

    @Column(name = "crystal_name", nullable = false)
    private String crystalName;

    @Column(name = "thermal_power", nullable = false)
    private int thermalPower;

    @Override
    public String toString() {
        return getProducer() + " " + core + "-" + getModel();
    }

    @Override
    public String info() {
        return socket + ", " + minFreq + "/" + maxFreq + "MHz" + ", " + coreNumber + ", " + crystalName + ", " + thermalPower;
    }
}
