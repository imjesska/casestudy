package com.customterrarium.dao;

import java.util.List;

import com.customterrarium.models.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PageRepository extends JpaRepository<Page, Integer> {

    Page findBySlug(String slug);

    // @Query("SELECT p FROM Page p WHERE p.id != :id and p.slug = :slug")
    // Page findBySlug(int id, String slug);

    Page findBySlugAndIdNot(String slug, int id);

    List<Page> findAllByOrderBySortingAsc();

}