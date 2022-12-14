package diplom.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ssd")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Ssd extends Component {

    @Column(name = "capacity", nullable = false)
    private int capacity;

    @Column(name = "form_factor", nullable = false)
    private String formFactor;

    @Column(name = "ssd_interface", nullable = false)
    private String ssdInterface;

    @Column(name = "controller", nullable = false)
    private String controller;

    @Column(name = "reading_speed", nullable = false)
    private int readingSpeed;

    @Column(name = "writing_speed", nullable = false)
    private int writingSpeed;

    @Column(name = "microchip_type", nullable = false)
    private String microchipType;

    @Column(name = "recording_resource", nullable = false)
    private int recordingResource;

    @Override
    public String toString() {
        return getProducer() + " " + getModel() + " " + capacity + "Gb";
    }

    @Override
    public String info() {
        return formFactor + ", " + ssdInterface + ", " + controller + ", " + readingSpeed + "/" + writingSpeed + ", " + microchipType + ", " + recordingResource;
    }
}
