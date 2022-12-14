package diplom.shop.model.component;

import diplom.shop.model.ComponentSource;
import diplom.shop.model.Review;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class Component {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "producer", nullable = false)
    private String producer;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "price", nullable = false)
    private double price;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @OneToMany(mappedBy = "component", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "component", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<ComponentSource> sources = new ArrayList<>();

    public void addReview(Review review) {
        reviews.add(review);
    }

    public String info() {
        return null;
    }

    public String getEncodeImage() {
        return image != null ? Base64.getEncoder().encodeToString(image) : null;
    }
}
