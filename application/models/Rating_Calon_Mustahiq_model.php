<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Rating_Calon_ Mustahiq_model $Rating_Calon_ Mustahiq_model
 */
class Rating_Calon_Mustahiq_model extends CI_Model
{


    public function insertrating($rating)
    {
        $query = $this->db->insert('rating_calon_mustahiq', $rating);
        return $query;
    }



}