package com.customterrarium.dao;

import java.util.List;

import com.customterrarium.models.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PageRepository extends JpaRepository<Page, Integer> {

    //Spring checks to find anything named slug/url name
    Page findBySlug(String slug);

    Page findBySlugAndIdNot(String slug, int id);

    List<Page> findAllByOrderBySortingAsc();

}