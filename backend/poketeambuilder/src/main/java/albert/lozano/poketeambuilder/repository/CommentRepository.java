/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.domain.Comment;
import albert.lozano.poketeambuilder.domain.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;

/**
 * CommentRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
        /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <Comment, Long>
        Comment -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
    void deleteByCreatedDateAndBodyAndTrainer(Date createdDate, String body, Trainer trainer);
}
